# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="move_file_request.rb">
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
  # Request model for move_file operation.
  #
  class MoveFileRequest
    # Destination file path e.g. '/dest.ext'.
    attr_accessor :dest_path

    # Source file's path e.g. '/Folder 1/file.ext' or '/Bucket/Folder 1/file.ext'.
    attr_accessor :src_path

    # Source storage name.
    attr_accessor :src_storage_name

    # Destination storage name.
    attr_accessor :dest_storage_name

    # File version ID to move.
    attr_accessor :version_id

    #
    # Initializes a new instance.
    # @param dest_path Destination file path e.g. '/dest.ext'.
    # @param src_path Source file's path e.g. '/Folder 1/file.ext' or '/Bucket/Folder 1/file.ext'.
    # @param src_storage_name Source storage name.
    # @param dest_storage_name Destination storage name.
    # @param version_id File version ID to move.

    def initialize(dest_path:, src_path:, src_storage_name: nil, dest_storage_name: nil, version_id: nil)
      self.dest_path = dest_path
      self.src_path = src_path
      self.src_storage_name = src_storage_name
      self.dest_storage_name = dest_storage_name
      self.version_id = version_id
    end

    def get_original_request
      self
    end

    # Creating batch part from request
    def to_batch_part(api_client, requestId, parentRequestId = nil)
      # verify the required parameter 'dest_path' is set
      raise ArgumentError, 'Missing the required parameter dest_path when calling WordsApi.move_file' if api_client.config.client_side_validation && self.dest_path.nil?
      # verify the required parameter 'src_path' is set
      raise ArgumentError, 'Missing the required parameter src_path when calling WordsApi.move_file' if api_client.config.client_side_validation && self.src_path.nil?

      # resource path
      local_var_path = '/words/storage/file/move/{srcPath}'[7..-1]
      local_var_path = local_var_path.sub('{' + downcase_first_letter('SrcPath') + '}', self.src_path.nil? ? '' : self.src_path.to_s)
      local_var_path = local_var_path.sub('//', '/')

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('DestPath')] = self.dest_path
      query_params[downcase_first_letter('SrcStorageName')] = self.src_storage_name unless self.src_storage_name.nil?
      query_params[downcase_first_letter('DestStorageName')] = self.dest_storage_name unless self.dest_storage_name.nil?
      query_params[downcase_first_letter('VersionId')] = self.version_id unless self.version_id.nil?

      if query_params
        query_params.each { |key, value| local_var_path = api_client.add_param_to_query(local_var_path, key, value) }
      end

      header_params = {}
      header_params['RequestId'] = requestId

      if parentRequestId != nil
        header_params['DependsOn'] = parentRequestId
      end

      # form parameters
      form_params = []
      files_content = []

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
      # verify the required parameter 'dest_path' is set
      raise ArgumentError, 'Missing the required parameter dest_path when calling WordsApi.move_file' if api_client.config.client_side_validation && self.dest_path.nil?
      # verify the required parameter 'src_path' is set
      raise ArgumentError, 'Missing the required parameter src_path when calling WordsApi.move_file' if api_client.config.client_side_validation && self.src_path.nil?

      # resource path
      local_var_path = '/words/storage/file/move/{srcPath}'[1..-1]
      local_var_path = local_var_path.sub('{' + downcase_first_letter('SrcPath') + '}', self.src_path.nil? ? '' : self.src_path.to_s)
      local_var_path = local_var_path.sub('//', '/')

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('DestPath')] = self.dest_path
      query_params[downcase_first_letter('SrcStorageName')] = self.src_storage_name unless self.src_storage_name.nil?
      query_params[downcase_first_letter('DestStorageName')] = self.dest_storage_name unless self.dest_storage_name.nil?
      query_params[downcase_first_letter('VersionId')] = self.version_id unless self.version_id.nil?

      # header parameters
      header_params = {}
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = api_client.select_header_content_type(['application/xml', 'application/json'])

      # form parameters
      form_params = []
      files_content = []
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
      nil
    end

    def deserialize_response(api_client, body, headers)
      nil
    end
  end
end
