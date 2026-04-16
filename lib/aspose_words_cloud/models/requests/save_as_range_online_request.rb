# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="save_as_range_online_request.rb">
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

module AsposeWordsCloud

  #
  # Request model for save_as_range_online operation.
  #
  class SaveAsRangeOnlineRequest
    # The document.
    attr_accessor :document

    # The range start identifier. Identifier examples: id0.0.0, page0.
    attr_accessor :range_start_identifier

    # Parameters of a new document.
    attr_accessor :document_parameters

    # The range end identifier. Identifier examples: id1.0.0, id0.0.0:end, page1, page1:end, document:end.
    attr_accessor :range_end_identifier

    # Encoding that will be used to load an HTML (or TXT) document if the encoding is not specified in HTML.
    attr_accessor :load_encoding

    # Password of protected Word document. Use the parameter to pass a password via SDK. SDK encrypts it automatically. We don't recommend to use the parameter to pass a plain password for direct call of API.
    attr_accessor :password

    # Password of protected Word document. Use the parameter to pass an encrypted password for direct calls of API. See SDK code for encyption details.
    attr_accessor :encrypted_password

    # The value indicates whether OpenType support is on.
    attr_accessor :open_type_support

    #
    # Initializes a new instance.
    # @param document The document.
    # @param range_start_identifier The range start identifier. Identifier examples: id0.0.0, page0.
    # @param document_parameters Parameters of a new document.
    # @param range_end_identifier The range end identifier. Identifier examples: id1.0.0, id0.0.0:end, page1, page1:end, document:end.
    # @param load_encoding Encoding that will be used to load an HTML (or TXT) document if the encoding is not specified in HTML.
    # @param password Password of protected Word document. Use the parameter to pass a password via SDK. SDK encrypts it automatically. We don't recommend to use the parameter to pass a plain password for direct call of API.
    # @param encrypted_password Password of protected Word document. Use the parameter to pass an encrypted password for direct calls of API. See SDK code for encyption details.
    # @param open_type_support The value indicates whether OpenType support is on.

    def initialize(document:, range_start_identifier:, document_parameters:, range_end_identifier: nil, load_encoding: nil, password: nil, encrypted_password: nil, open_type_support: nil)
      self.document = document
      self.range_start_identifier = range_start_identifier
      self.document_parameters = document_parameters
      self.range_end_identifier = range_end_identifier
      self.load_encoding = load_encoding
      self.password = password
      self.encrypted_password = encrypted_password
      self.open_type_support = open_type_support
    end

    def get_original_request
      self
    end

    # Creating batch part from request
    def to_batch_part(api_client, requestId, parentRequestId = nil)
      # verify the required parameter 'document' is set
      raise ArgumentError, 'Missing the required parameter document when calling WordsApi.save_as_range_online' if api_client.config.client_side_validation && self.document.nil?
      # verify the required parameter 'range_start_identifier' is set
      raise ArgumentError, 'Missing the required parameter range_start_identifier when calling WordsApi.save_as_range_online' if api_client.config.client_side_validation && self.range_start_identifier.nil?
      # verify the required parameter 'document_parameters' is set
      raise ArgumentError, 'Missing the required parameter document_parameters when calling WordsApi.save_as_range_online' if api_client.config.client_side_validation && self.document_parameters.nil?
      self.document_parameters.validate
      # resource path
      local_var_path = '/words/online/post/range/{rangeStartIdentifier}/{rangeEndIdentifier}/SaveAs'[7..-1]
      local_var_path = local_var_path.sub('{' + downcase_first_letter('RangeStartIdentifier') + '}', self.range_start_identifier.nil? ? '' : self.range_start_identifier.to_s)
      local_var_path = local_var_path.sub('{' + downcase_first_letter('RangeEndIdentifier') + '}', self.range_end_identifier.nil? ? '' : self.range_end_identifier.to_s)
      local_var_path = local_var_path.sub('//', '/')

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('LoadEncoding')] = self.load_encoding unless self.load_encoding.nil?
      query_params[downcase_first_letter('Password')] = self.password unless self.password.nil?
      query_params[downcase_first_letter('EncryptedPassword')] = self.encrypted_password unless self.encrypted_password.nil?
      query_params[downcase_first_letter('OpenTypeSupport')] = self.open_type_support unless self.open_type_support.nil?

      if query_params
        query_params.each { |key, value| local_var_path = api_client.add_param_to_query(local_var_path, key, value) }
      end

      header_params = {}
      # header parameters
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = api_client.select_header_content_type(['multipart/form-data'])
      header_params['RequestId'] = requestId

      if parentRequestId != nil
        header_params['DependsOn'] = parentRequestId
      end

      # form parameters
      form_params = []
      files_content = []
      if self.document.nil?
        raise "Parameter Document is required."
      end
      unless self.document.nil?
        form_params.push({:'Name' => 'document', :'Data' => self.document, :'MimeType' =>'application/octet-stream'})
      end

      if self.document_parameters.nil?
        raise "Parameter DocumentParameters is required."
      end
      unless self.document_parameters.nil?
        form_params.push({:'Name' => 'documentParameters', :'Data' => self.document_parameters.to_body.to_json, :'MimeType' =>'application/json'})
      end


      # http body (model)
      body = api_client.build_request_body_batch(header_params, form_params, files_content)
      part = ""
      part.concat("PUT".force_encoding('UTF-8'))
      part.concat(" ".force_encoding('UTF-8'))
      part.concat(local_var_path.force_encoding('UTF-8'))
      part.concat(" \r\n".force_encoding('UTF-8'))

      header_params.each_pair {|key, value| part.concat(key.dup.force_encoding('UTF-8') , ": ".force_encoding('UTF-8'), value.dup.force_encoding('UTF-8'), "\r\n".force_encoding('UTF-8')) }
      part.concat("\r\n".force_encoding('UTF-8'))
      if body
        if body.is_a?(Hash)
          body.each do |key, value|
            part.concat(value, "\r\n")
          end
        else
          part.concat(body)
        end
      end
     part
    end

    def create_http_request(api_client)
      # verify the required parameter 'document' is set
      raise ArgumentError, 'Missing the required parameter document when calling WordsApi.save_as_range_online' if api_client.config.client_side_validation && self.document.nil?
      # verify the required parameter 'range_start_identifier' is set
      raise ArgumentError, 'Missing the required parameter range_start_identifier when calling WordsApi.save_as_range_online' if api_client.config.client_side_validation && self.range_start_identifier.nil?
      # verify the required parameter 'document_parameters' is set
      raise ArgumentError, 'Missing the required parameter document_parameters when calling WordsApi.save_as_range_online' if api_client.config.client_side_validation && self.document_parameters.nil?
      self.document_parameters.validate
      # resource path
      local_var_path = '/words/online/post/range/{rangeStartIdentifier}/{rangeEndIdentifier}/SaveAs'[1..-1]
      local_var_path = local_var_path.sub('{' + downcase_first_letter('RangeStartIdentifier') + '}', self.range_start_identifier.nil? ? '' : self.range_start_identifier.to_s)
      local_var_path = local_var_path.sub('{' + downcase_first_letter('RangeEndIdentifier') + '}', self.range_end_identifier.nil? ? '' : self.range_end_identifier.to_s)
      local_var_path = local_var_path.sub('//', '/')

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('LoadEncoding')] = self.load_encoding unless self.load_encoding.nil?
      query_params[downcase_first_letter('Password')] = self.password unless self.password.nil?
      query_params[downcase_first_letter('EncryptedPassword')] = self.encrypted_password unless self.encrypted_password.nil?
      query_params[downcase_first_letter('OpenTypeSupport')] = self.open_type_support unless self.open_type_support.nil?

      # header parameters
      header_params = {}
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = api_client.select_header_content_type(['multipart/form-data'])

      # form parameters
      form_params = []
      files_content = []
      if self.document.nil?
        raise "Parameter Document is required."
      end
      unless self.document.nil?
        form_params.push({:'Name' => 'document', :'Data' => self.document, :'MimeType' =>'application/octet-stream'})
      end

      if self.document_parameters.nil?
        raise "Parameter DocumentParameters is required."
      end
      unless self.document_parameters.nil?
        form_params.push({:'Name' => 'documentParameters', :'Data' => self.document_parameters.to_body.to_json, :'MimeType' =>'application/json'})
      end

      body = api_client.build_request_body(header_params, form_params, files_content)
      {
        'method': :PUT,
        'path': local_var_path,
        'header_params': header_params,
        'query_params': query_params,
        'body': body,
        'auth_names': ['JWT']
      }
    end

    #
    # Helper method to convert first letter to downcase
    #
    def downcase_first_letter(str)
      str[0].downcase + str[1..-1]
    end

    # Get response type
    def get_response_type
      'SaveAsRangeOnlineResponse'
    end

    def deserialize_response(api_client, body, headers)
      mp_data = SaveAsRangeOnlineResponse.new()
      multipart_data = api_client.deserialize_multipart(body, headers)
      mp_data.model = multipart_data['Model'].nil? ? nil : api_client.deserialize(multipart_data['Model'][:data], multipart_data['Model'][:headers], 'DocumentResponse')
      mp_data.document = multipart_data['Document'].nil? ? nil : api_client.parse_files_collection(multipart_data['Document'][:data], multipart_data['Document'][:headers])
            mp_data
    end
  end
end
