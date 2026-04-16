# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="build_report_online_request.rb">
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
  # Request model for build_report_online operation.
  #
  class BuildReportOnlineRequest
    # File with template.
    attr_accessor :template

    # A string providing data to populate the specified template. The string must be of one of the following types: xml, json, csv.
    attr_accessor :data

    # An object providing settings of a report engine.
    attr_accessor :report_engine_settings

    # The filename of the output document, that will be used when the resulting document has a dynamic field {filename}. If it is not set, the "template" will be used instead.
    attr_accessor :document_file_name

    #
    # Initializes a new instance.
    # @param template File with template.
    # @param data A string providing data to populate the specified template. The string must be of one of the following types: xml, json, csv.
    # @param report_engine_settings An object providing settings of a report engine.
    # @param document_file_name The filename of the output document, that will be used when the resulting document has a dynamic field {filename}. If it is not set, the "template" will be used instead.

    def initialize(template:, data:, report_engine_settings:, document_file_name: nil)
      self.template = template
      self.data = data
      self.report_engine_settings = report_engine_settings
      self.document_file_name = document_file_name
    end

    def get_original_request
      self
    end

    # Creating batch part from request
    def to_batch_part(api_client, requestId, parentRequestId = nil)
      # verify the required parameter 'template' is set
      raise ArgumentError, 'Missing the required parameter template when calling WordsApi.build_report_online' if api_client.config.client_side_validation && self.template.nil?
      # verify the required parameter 'data' is set
      raise ArgumentError, 'Missing the required parameter data when calling WordsApi.build_report_online' if api_client.config.client_side_validation && self.data.nil?
      # verify the required parameter 'report_engine_settings' is set
      raise ArgumentError, 'Missing the required parameter report_engine_settings when calling WordsApi.build_report_online' if api_client.config.client_side_validation && self.report_engine_settings.nil?
      self.report_engine_settings.validate
      # resource path
      local_var_path = '/words/buildReport'[7..-1]
      local_var_path = local_var_path.sub('//', '/')

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('DocumentFileName')] = self.document_file_name unless self.document_file_name.nil?

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
      if self.template.nil?
        raise "Parameter Template is required."
      end
      unless self.template.nil?
        form_params.push({:'Name' => 'template', :'Data' => self.template, :'MimeType' =>'application/octet-stream'})
      end

      if self.data.nil?
        raise "Parameter Data is required."
      end
      unless self.data.nil?
        form_params.push({:'Name' => 'data', :'Data' => self.data, :'MimeType' =>'text/plain'})
      end

      if self.report_engine_settings.nil?
        raise "Parameter ReportEngineSettings is required."
      end
      unless self.report_engine_settings.nil?
        form_params.push({:'Name' => 'reportEngineSettings', :'Data' => self.report_engine_settings.to_body.to_json, :'MimeType' =>'application/json'})
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
      # verify the required parameter 'template' is set
      raise ArgumentError, 'Missing the required parameter template when calling WordsApi.build_report_online' if api_client.config.client_side_validation && self.template.nil?
      # verify the required parameter 'data' is set
      raise ArgumentError, 'Missing the required parameter data when calling WordsApi.build_report_online' if api_client.config.client_side_validation && self.data.nil?
      # verify the required parameter 'report_engine_settings' is set
      raise ArgumentError, 'Missing the required parameter report_engine_settings when calling WordsApi.build_report_online' if api_client.config.client_side_validation && self.report_engine_settings.nil?
      self.report_engine_settings.validate
      # resource path
      local_var_path = '/words/buildReport'[1..-1]
      local_var_path = local_var_path.sub('//', '/')

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('DocumentFileName')] = self.document_file_name unless self.document_file_name.nil?

      # header parameters
      header_params = {}
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = api_client.select_header_content_type(['multipart/form-data'])

      # form parameters
      form_params = []
      files_content = []
      if self.template.nil?
        raise "Parameter Template is required."
      end
      unless self.template.nil?
        form_params.push({:'Name' => 'template', :'Data' => self.template, :'MimeType' =>'application/octet-stream'})
      end

      if self.data.nil?
        raise "Parameter Data is required."
      end
      unless self.data.nil?
        form_params.push({:'Name' => 'data', :'Data' => self.data, :'MimeType' =>'text/plain'})
      end

      if self.report_engine_settings.nil?
        raise "Parameter ReportEngineSettings is required."
      end
      unless self.report_engine_settings.nil?
        form_params.push({:'Name' => 'reportEngineSettings', :'Data' => self.report_engine_settings.to_body.to_json, :'MimeType' =>'application/json'})
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
      'File'
    end

    def deserialize_response(api_client, body, headers)
      api_client.deserialize(body, headers, 'File')
    end
  end
end
