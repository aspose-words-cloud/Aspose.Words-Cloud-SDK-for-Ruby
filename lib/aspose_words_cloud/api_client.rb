# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="api_client.rb">
#   Copyright (c) 2026 Aspose.Words for Cloud
# </copyright>
# <summary>
#  Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to deal
#  in the Software without restriction, including without limitation the rights
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#  copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in all
#  copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#  SOFTWARE.
# </summary>
# ------------------------------------------------------------------------------------

require 'date'
require 'json'
require 'logger'
require 'tempfile'
require 'timeout'
require 'uri'
require 'faraday'
require 'base64'
require 'marcel'
require 'multipart_parser/reader'
require_relative 'version'
require_relative 'api_error'

module AsposeWordsCloud
  #
  # api client is mainly responsible for making the HTTP call to the API backend.
  # 
  class ApiClient
    # The Configuration object holding settings to be used in the API client.
    attr_accessor :config

    # Defines the headers to be used in HTTP requests of all API calls by default.
    #
    # @return [Hash]
    attr_accessor :default_headers

    # Initializes the ApiClient
    # @option config [Configuration] Configuration for initializing the object, default to Configuration.default
    def initialize(config = Configuration.default)
      @config = config
      @default_headers = {
        'Content-Type' => "application/json",
        'x-aspose-client' => "ruby sdk",
        'x-aspose-client-version' => AsposeWordsCloud::VERSION.to_s
      }
    end

    def self.default
      @@default ||= ApiClient.new
    end

    # Call an API with given options.
    #
    # @return [Array<(Object, Fixnum, Hash)>] an array of 3 elements:
    #   the data deserialized from response body (could be nil), response status code and response headers.
    def call_api(http_method, path, opts = {})
      if @config.client_data['ClientId'].nil? || @config.client_data['ClientId'] == ''
        raise "ClientId could not be an empty string."
      end

      if @config.client_data['ClientSecret'].nil? || @config.client_data['ClientSecret'] == ''
        raise "ClientSecret could not be an empty string."
      end

      response = build_request(http_method, path, opts)
      if @config.debugging
        @config.logger.debug "'HTTP' response body '~BEGIN~'\n #{response.body}\n'~END~'\n"
      end

      unless response.success?
        if response.status == 0
          # Errors from libcurl will be made visible here
          raise ApiError.new(:code => 0,
                            :message => response.reason_phrase)
        else
          raise ApiError.new(:code => response.status,
                            :response_headers => response.headers,
                            :response_body => response.body),
               response.reason_phrase
        end
      end

      if opts[:multipart_response] == true
        data = deserialize_multipart(response.body, response.headers)
      elsif opts[:batch] == true
        data = deserialize_batch(response, opts[:request_map])
      elsif opts[:return_raw] == true
        data = response.body
      else
        data = deserialize(response.body, response.headers, opts[:return_type]) if opts[:return_type]
      end

      [data, response.status, response.headers]
    end

    # Builds the HTTP request
    #
    # @param [String] http_method HTTP method/verb (e.g. POST)
    # @param [String] path URL path (e.g. /account/new)
    # @option opts [Hash] :header_params Header parameters
    # @option opts [Hash] :query_params Query parameters
    # @option opts [Object] :body HTTP body (JSON/XML)
    # @return [Faraday::Response] A Faraday Response
    def build_request(http_method, path, opts = {})
      url = build_request_url(path)
      http_method = http_method.to_sym.downcase

      header_params = @default_headers.merge(opts[:header_params] || {})
      query_params = opts[:query_params] || {}
      update_params_for_auth! header_params, query_params, ["JWT"]
      body = opts[:body] if opts[:body] || nil?

      req_opts = {
        :method => http_method,
        :headers => header_params,
        :params => query_params,
        :body => body
      }

      if [:post, :patch, :put, :delete].include?(http_method)
        if @config.debugging
          @config.logger.debug "HTTP request body param ~BEGIN~\n#{req_body}\n~END~\n"
        end
      end

      conn = Faraday.new url, { :params => query_params, :headers => header_params, request: { timeout: @config.timeout }} do |f|
      f.request :multipart
      f.request :url_encoded
      f.adapter Faraday.default_adapter
      end

      case http_method
      when :post
        return conn.post url, req_opts[:body]
      when :put
        return conn.put url, req_opts[:body]
      when :get
        return conn.get url, req_opts[:body]
      else
        conn.delete url do |c|
          c.body = req_opts[:body]
        end
      end
    end

    # Check if the given MIME is a JSON MIME.
    # JSON MIME examples:
    #   application/json
    #   application/json; charset=UTF8
    #   APPLICATION/JSON
    #   */*
    # @param [String] mime MIME
    # @return [Boolean] True if the MIME is application/json
    def json_mime?(mime)
       (mime == "*/*") || !(mime =~ /Application\/.*json(?!p)(;.*)?/i).nil?
    end

    def custom_strip(string, chars)
      chars = Regexp.escape(chars)
      string.gsub(/\A[#{chars}]+|[#{chars}]+\z/, "")
    end

    def extract_filename_from_headers(headers)
      filename = 'default'
      if headers.key?('content-disposition')
        disposition = headers['content-disposition']
        parts = disposition.split(';')
        for part in parts
          part2 = custom_strip(part, ' ')
          subparts = part2.split('=')
          if subparts.length() == 2 && subparts[0] == 'filename'
            filename = custom_strip(subparts[1], ' \"')
          end
        end
      end

      filename
    end

    def extract_partname_from_headers(headers)
      filename = 'default'
      if headers.key?('content-disposition')
        disposition = headers['content-disposition']
        parts = disposition.split(';')
        for part in parts
          part2 = custom_strip(part, ' ')
          subparts = part2.split('=')
          if subparts.length() == 2 && subparts[0] == 'name'
            filename = custom_strip(subparts[1], ' \"')
          end
        end
      end

      filename
    end

    # Deserialize files collection.
    def parse_files_collection(data, headers)
      result = {}
      if headers.key?("content-type") && headers['content-type'].start_with?('multipart/mixed')
        content_type = headers['content-type']
        reader = MultipartParser::Reader.new(MultipartParser::Reader::extract_boundary_value(content_type))
        reader.on_part do |part|
          pn = extract_filename_from_headers(part.headers)
          part.on_data do |partial_data|
            if result[pn].nil?
              result[pn] = partial_data
            else
              result[pn] = [result[pn]] if result[pn].kind_of?(Array)
              result[pn] << partial_data
            end
          end
        end

        reader.write data
        reader.ended? or raise Exception, 'Truncated multipart message'
      else
        result[extract_filename_from_headers(headers)] = data
      end

      result
    end

    # Deserialize the response to the given return type.
    #
    # @param [String] response HTTP response
    # @param [String] return_type some examples: "User", "Array[User]", "Hash[String,Integer]"
    def deserialize(body, headers, return_type)
      # handle file downloading - return the File instance processed in request callbacks
      # note that response body is empty when the file is written in chunks in request on_body callback
      return body if return_type == 'File'

      return parse_files_collection(body, headers) if return_type == 'FILES_COLLECTION'

      return nil if body.nil? || body.empty?

      # return response body directly for String return type
      return body if return_type == 'String'

      begin
        data = JSON.parse("[#{body}]", :symbolize_names => true)[0]
      rescue JSON::ParserError => e
        if %w[String Date DateTime].include?(return_type)
          data = body
        else
          raise e
        end
      end

      convert_to_type data, return_type
    end

    # Deserialize multipart the response to the given return type.
    #
    # @param [Response] response HTTP response
    def deserialize_multipart(body, headers)
      parts={}
      content_type = headers['content-type']
      reader = MultipartParser::Reader.new(MultipartParser::Reader::extract_boundary_value(content_type))

      reader.on_part do |part|
        pn = extract_partname_from_headers(part.headers)
        part.on_data do |partial_data|
          if parts[pn].nil?
            parts[pn] = { data: partial_data, headers: part.headers }
          else
            parts[pn][:data] = [parts[pn][:data]] if parts[pn][:data].kind_of?(Array)
            parts[pn][:data] << partial_data
          end
        end
      end

      reader.write body
      reader.ended? or raise Exception, 'Truncated multipart message'

      parts
    end

    def deserialize_multipart_array(body, headers)
      parts = []
      content_type = headers['content-type']
      reader = MultipartParser::Reader.new(MultipartParser::Reader::extract_boundary_value(content_type))

      reader.on_part do |part|
        part_data = { data: "", headers: part.headers }
        parts << part_data
        part.on_data do |partial_data|
          part_data[:data] << partial_data
        end
      end

      reader.write body
      reader.ended? or raise Exception, 'Truncated multipart message'

      parts
    end

    def deserialize_job_info_part(part)
      deserialize(part[:data], part[:headers], 'JobInfo')
    end

    def deserialize_http_response_part(request, part_data)
      status_line_index = part_data.index("\r\n")
      raise ApiError.new(code: 400, message: 'Failed to parse HTTP response part.', response_headers: {}, response_body: '') if status_line_index.nil?

      status_line = part_data[0...status_line_index]
      status_line_parts = status_line.split(' ', 3)
      if status_line_parts.length < 3 || !status_line_parts[0].start_with?('HTTP/')
        raise ApiError.new(code: 400, message: 'Failed to parse HTTP response part.', response_headers: {}, response_body: '')
      end

      status_code = status_line_parts[1].to_i
      headers_end_index = part_data.index("\r\n\r\n")
      response_headers = {}
      response_body = ''

      if headers_end_index.nil?
        response_body = part_data[(status_line_index + 2)..-1] || ''
      else
        header_lines = part_data[(status_line_index + 2)...headers_end_index].split("\r\n")
        header_lines.each do |header_line|
          next unless header_line.include?(':')
          key, value = header_line.split(':', 2)
          response_headers[key.strip.downcase] = value.strip
        end
        response_body = part_data[(headers_end_index + 4)..-1] || ''
      end

      if status_code < 200 || status_code >= 300
        raise ApiError.new(code: status_code, message: response_body, response_headers: response_headers, response_body: response_body)
      end

      request.deserialize_response(self, response_body, response_headers)
    end

    # Deserialize batch
    def deserialize_batch(response, request_map)
      result = { errors: [], parts: [] }
      def result.part(name)
        hash = self[:parts].detect { |h| h[:part].name == name }
        [hash[:part], hash[:body].join]
      end
      responses_data = []
      content_type = response.headers['content-type']
      reader = MultipartParser::Reader.new(MultipartParser::Reader::extract_boundary_value(content_type))
      reader.on_part do |part|
        result[:parts] << thispart = {
          part: part,
          body: []
        }
        part.on_data do |chunk|
          thispart[:body] << chunk
        end
      end
      reader.on_error do |msg|
        result[:errors] << msg
      end
      reader.write response.body
      reader.ended? or raise Exception, 'Truncated multipart message'

      separator = "\r\n\r\n"
      result[:parts].each do |part|
        part[:body] = part[:body].join("")
        part_body = part[:body]
        data_index = part_body.index(separator)
        if data_index != nil
          header_data = part_body[0..data_index]
          body_data = part_body[data_index+separator.length, part_body.length]
          part[:headers] = header_data
          part[:body] = body_data
        end
      end

      result[:parts].each_with_index do |response_data, index|
        req_id = response_data[:part].headers['requestid']
        batch_request = request_map[req_id]
        return_type = batch_request.request.get_response_type
        responses_data.push(deserialize(response_data[:body], response_data[:part].headers, return_type))
      end
      responses_data
    end

    # Convert data to the given return type.
    # @param [Object] data Data to be converted
    # @param [String] return_type Return type
    # @return [Mixed] Data in a particular type
    def convert_to_type(data, return_type)
      return nil if data.nil?
      case return_type
      when 'String'
        data.to_s
      when 'Integer'
        data.to_i
      when 'Float'
        data.to_f
      when 'BOOLEAN'
        data == true
      when 'DateTime'
        # parse date time (expecting ISO 8601 format)
        DateTime.parse data
      when 'Date'
        # parse date time (expecting ISO 8601 format)
        Date.parse data
      when 'Object'
        # generic object (usually a Hash), return directly
        data
      when /\AArray<(.+)>\z/
        # e.g. Array<Pet>
        sub_type = $1
        data.map {|item| convert_to_type(item, sub_type) }
      when /\AHash\<String, (.+)\>\z/
        # e.g. Hash<String, Integer>
        sub_type = $1
        {}.tap do |hash|
          data.each {|k, v| hash[k] = convert_to_type(v, sub_type) }
        end
      else
        # models, e.g. Pet
        if data[:'$type']
          return_type = data[:'$type'][0..-4]
        end

        AsposeWordsCloud.const_get(return_type).new.tap do |model|
          model.build_from_hash data
        end
      end
    end

    # Sanitize filename by removing path.
    # e.g. ../../sun.gif becomes sun.gif
    #
    # @param [String] filename the filename to be sanitized
    # @return [String] the sanitized filename
    def sanitize_filename(filename)
      filename.gsub(/.*[\/\\]/, '')
    end

    def build_request_url(path)
      # remove empty path parameter artifacts
      path = path.gsub(/\/+/, '/')
      return @config.getFullUrl(path, path == "/v4.0/words/connect/token")
    end

    # Builds the HTTP request body
    #
    # @param [Hash] header_params Header parameters
    # @param [Hash] form_params Query parameters
    # @param [Object] body HTTP body (JSON/XML)
    # @return [String] HTTP body data in the form of string
    def build_request_body(header_params, form_params, files_references)
      # http form
      files_references.each do |file_reference|
        if !file_reference.password.nil?
            file_reference.encryptedPassword = self.config.encryptor.encrypt(file_reference.password)
            file_reference.password = nil
        end
        if file_reference.source == 'Request'
            form_params.push({:'Name' => file_reference.reference, :'Data' => file_reference.content, :'MimeType' =>'application/octet-stream'})
        end
      end

      if form_params.length() == 0
        data = nil
      elsif form_params.length() == 1
        form_param = form_params[0]
        value = form_param[:'Data']
        case value
        when ::File, ::Tempfile
          data = File.open(value.path, 'rb') { |f| f.read }
        when ::Array, nil, Faraday::ParamPart
          data = value
        else
          data = value.to_s
        end
        header_params['Content-Type'] = form_param[:'MimeType']
      else
        data = {}
        form_params.each do |form_param|
          key = form_param[:'Name']
          value = form_param[:'Data']
          mimeType = form_param[:'MimeType']
          case value
          when ::File, ::Tempfile
            data[key] = Faraday::FilePart.new(value.path, mimeType)
          when ::Array, nil, Faraday::ParamPart
            data[key] = value
          else
            data[key] = Faraday::ParamPart.new(value.to_s, mimeType)
          end
        end
      end

      data
    end

    # Builds the HTTP request body
    #
    # @param [Hash] header_params Header parameters
    # @param [Hash] form_params Query parameters
    # @param [Object] body HTTP body (JSON/XML)
    # @return [String] HTTP body data in the form of string
    def build_request_body_batch(header_params, form_params, files_references)
      files_references.each do |file_reference|
        if !file_reference.password.nil?
            file_reference.encryptedPassword = self.config.encryptor.encrypt(file_reference.password)
            file_reference.password = nil
        end
        if file_reference.source == 'Request'
            form_params.push({:'Name' => file_reference.reference, :'Data' => file_reference.content, :'MimeType' =>'application/octet-stream'})
        end
      end

      if form_params.length() == 0
        data = ''
      elsif form_params.length() == 1
        form_param = form_params[0]
        key = form_param[:'Name']
        value = form_param[:'Data']
        case value
        when ::File, ::Tempfile
          data = File.open(value.path, 'rb') { |f| f.read }
        when ::Array, nil, Faraday::ParamPart
          data = value
        else
          data = value.to_s
        end
        header_params['Content-Type'] = form_param[:'MimeType']
      else
        boundary = SecureRandom.uuid
        data = ""
        form_params.each do |form_param|
          key = form_param[:'Name']
          value = form_param[:'Data']
          mimeType = form_param[:'MimeType']
          data.concat(("--" + boundary + "\r\n").force_encoding('UTF-8'))
          data.concat(("Content-Type: " + mimeType + "\r\n").force_encoding('UTF-8'))
          data.concat(("Content-Disposition: form-data; name=\"" + key + "\"\r\n\r\n").force_encoding('UTF-8'))
          case value
          when ::File, ::Tempfile
            data.concat(File.open(value.path, 'rb') { |f| f.read })
          when ::Array, nil, Faraday::ParamPart
            data.concat(value)
          else
            data.concat(value.to_s)
          end
          data.concat(("\r\n").force_encoding('UTF-8'))
        end
        data.concat(("--" + boundary + "--").force_encoding('UTF-8'))
        header_params['Content-Type'] = 'multipart/form-data; boundary="' + boundary + '"';
      end

      data
    end

    # Append query parameter to url
    #
    # @param [String] url current url
    # @param [String] param_name query parameter name
    # @param [String] param_value query parameter value
    def add_param_to_query(url, param_name, param_value)
      uri = URI(url)
      if param_name == 'password' && !param_value.empty?
        params = URI.decode_www_form(uri.query || "") << ['encryptedPassword', self.config.encryptor.encrypt(param_value)]
      else
        params = URI.decode_www_form(uri.query || "") << [param_name, param_value]
      end

      uri.query = URI.encode_www_form(params)
      uri.to_s
    end

    # Update hearder and query params based on authentication settings.
    #
    # @param [Hash] header_params Header parameters
    # @param [Hash] query_params Query parameters
    # @param [String] auth_names Authentication scheme name
    def update_params_for_auth!(header_params, query_params, auth_names)
      Array(auth_names).each do |auth_name|
        auth_setting = @config.auth_settings[auth_name]
        next unless auth_setting
        case auth_setting[:in]
        when 'header' then header_params[auth_setting[:key]] = auth_setting[:value]
        when 'query'  then query_params[auth_setting[:key]] = auth_setting[:value]
        else raise ArgumentError, 'Authentication token must be in `query` of `header`'
        end
      end
    end

    # Sets user agent in HTTP header
    #
    # @param [String] user_agent User agent (e.g. swagger-codegen/ruby/1.0.0)
    def user_agent=(user_agent)
      @user_agent = user_agent
      @default_headers['User-Agent'] = @user_agent
    end

    # Return Accept header based on an array of accepts provided.
    # @param [Array] accepts array for Accept
    # @return [String] the Accept header (e.g. application/json)
    def select_header_accept(accepts)
      return nil if accepts.nil? || accepts.empty?
      # use JSON when present, otherwise use all of the provided
      json_accept = accepts.find { |s| json_mime?(s) }
      return json_accept || accepts.join(',')
    end

    # Return Content-Type header based on an array of content types provided.
    # @param [Array] content_types array for Content-Type
    # @return [String] the Content-Type header  (e.g. application/json)
    def select_header_content_type(content_types)
      # use application/json by default
      return 'application/json' if content_types.nil? || content_types.empty?
      # use JSON when present, otherwise use the first one
      json_content_type = content_types.find { |s| json_mime?(s) }
      return json_content_type || content_types.first
    end

    # Convert object (array, hash, object, etc) to JSON string.
    # @param [Object] model object to be converted into JSON string
    # @return [String] JSON string representation of the object
    def object_to_http_body(model)
      return '"' + model + '"' if model.is_a?(String)
      return model if model.nil? 
      local_body = nil
      if model.is_a?(Array)
        local_body = model.map { |m| object_to_hash(m) }
      else
        local_body = object_to_hash(model)
      end
      local_body.to_json
    end

    # Convert object(non-array) to hash.
    # @param [Object] obj object to be converted into JSON string
    # @return [String] JSON string representation of the object
    def object_to_hash(obj)
      if obj.respond_to?(:to_hash)
        obj.to_hash
      else
        obj
      end
    end

    # Build parameter value according to the given collection format.
    # @param [String] collection_format one of :csv, :ssv, :tsv, :pipes and :multi
    def build_collection_param(param, collection_format)
      case collection_format
      when :csv
        param.join(',')
      when :ssv
        param.join(' ')
      when :tsv
        param.join("\t")
      when :pipes
        param.join('|')
      when :multi
        # return the array directly as faraday will handle it as expected
        param
      else
        raise "unknown collection format: #{collection_format.inspect}"
      end
    end
  end
end
