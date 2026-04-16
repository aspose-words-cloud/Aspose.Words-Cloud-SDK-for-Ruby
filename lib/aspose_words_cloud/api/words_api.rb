# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="words_api.rb">
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

require 'uri'
require 'json'
require 'faraday'

module AsposeWordsCloud
  #
  # Aspose.Words for Cloud API
  #
  class WordsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
      @api_client.config.encryptor = self
      @rsa_key = nil
      require_all '../models/requests'
      require_all '../models/responses'
      request_token
    end

    def batch(batch_requests, display_intermediate_result = true)
      raise ArgumentError, 'Requests array is nil' unless batch_requests != nil
      raise ArgumentError, 'There must be at least one request' unless batch_requests.length != 0
      form_params = {}
      id_request_to_map = {}
      request_token
      header_params = {'Content-Type' => 'multipart/form-data'}
      @api_client.update_params_for_auth! header_params, {}, "JWT"
      batch_requests.each_with_index do |batch_request, index|
        form_params["request-#{index}"] = Faraday::ParamPart.new(batch_request.request.to_batch_part(@api_client, batch_request.request_id, batch_request.parent_request_id), "application/http; msgtype=request")
        id_request_to_map[batch_request.request_id] = batch_request
      end
      url = display_intermediate_result ? "/v4.0/words/batch" : "/v4.0/words/batch?displayIntermediateResults=false"
      data, status_code, headers = @api_client.call_api(:PUT, url,
                                                        header_params: header_params,
                                                        query_params: {},
                                                        body: form_params,
                                                        batch: true,
                                                        request_map: id_request_to_map)
      [data, status_code, headers]
    end

    def call_job_result(job_id)
      begin
        data, _status_code, _headers = call_job_result_with_http_info(job_id)
      rescue ApiError => e
        if e.code == 401
          request_token
          data, _status_code, _headers = call_job_result_with_http_info(job_id)
        else
          raise
        end
      end
      data
    end

    private def call_job_result_with_http_info(job_id)
        raise ArgumentError, 'Missing the required parameter job_id when calling call_job_result' if job_id.nil?

        @api_client.config.logger.debug 'Calling API: WordsApi.call_job_result ...' if @api_client.config.debugging
        header_params = {}
        query_params = { 'id' => job_id }
            data, status_code, headers = @api_client.call_api(
                                                            :GET,
                                                            'words/job',
                                                            header_params: header_params,
                                                            query_params: query_params,
                                                            body: nil,
                                                            return_raw: true)
            [@api_client.deserialize_multipart_array(data, headers), status_code, headers]
    end

    # Accepts all the revisions in the document.
    # @param request AcceptAllRevisionsRequest
    # @return [RevisionsModificationResponse]
    def accept_all_revisions(request)
        begin
        data, _status_code, _headers = accept_all_revisions_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = accept_all_revisions_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Accepts all the revisions in the document.
    # @param request AcceptAllRevisionsRequest
    # @return [Array<(RevisionsModificationResponse, Fixnum, Hash)>]
    # RevisionsModificationResponse, response status code and response headers
    private def accept_all_revisions_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? AcceptAllRevisionsRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.accept_all_revisions ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'RevisionsModificationResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#accept_all_revisions\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Accepts all the revisions in the document.
    # @param request AcceptAllRevisionsOnlineRequest
    # @return [AcceptAllRevisionsOnlineResponse]
    def accept_all_revisions_online(request)
        begin
        data, _status_code, _headers = accept_all_revisions_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = accept_all_revisions_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Accepts all the revisions in the document.
    # @param request AcceptAllRevisionsOnlineRequest
    # @return [Array<(AcceptAllRevisionsOnlineResponse, Fixnum, Hash)>]
    # AcceptAllRevisionsOnlineResponse, response status code and response headers
    private def accept_all_revisions_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? AcceptAllRevisionsOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.accept_all_revisions_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'AcceptAllRevisionsOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#accept_all_revisions_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = AcceptAllRevisionsOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'RevisionsModificationResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Appends documents to the original document.
    # @param request AppendDocumentRequest
    # @return [DocumentResponse]
    def append_document(request)
        begin
        data, _status_code, _headers = append_document_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = append_document_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Appends documents to the original document.
    # @param request AppendDocumentRequest
    # @return [Array<(DocumentResponse, Fixnum, Hash)>]
    # DocumentResponse, response status code and response headers
    private def append_document_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? AppendDocumentRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.append_document ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'DocumentResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#append_document\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Appends documents to the original document.
    # @param request AppendDocumentJobRequest
    # @return [JobHandler]
    def append_document_job(request)
        begin
        data, _status_code, _headers = append_document_job_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = append_document_job_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Appends documents to the original document.
    # @param request AppendDocumentJobRequest
    # @return [Array<(JobHandler, Fixnum, Hash)>]
    # JobHandler, response status code and response headers
    private def append_document_job_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? AppendDocumentJobRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.append_document_job ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'JobInfo')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#append_document_job\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [JobHandler.new(self, request.get_original_request, data), status_code, headers]
    end

    # Appends documents to the original document.
    # @param request AppendDocumentOnlineRequest
    # @return [AppendDocumentOnlineResponse]
    def append_document_online(request)
        begin
        data, _status_code, _headers = append_document_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = append_document_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Appends documents to the original document.
    # @param request AppendDocumentOnlineRequest
    # @return [Array<(AppendDocumentOnlineResponse, Fixnum, Hash)>]
    # AppendDocumentOnlineResponse, response status code and response headers
    private def append_document_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? AppendDocumentOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.append_document_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'AppendDocumentOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#append_document_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = AppendDocumentOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'DocumentResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Appends documents to the original document.
    # @param request AppendDocumentOnlineJobRequest
    # @return [JobHandler]
    def append_document_online_job(request)
        begin
        data, _status_code, _headers = append_document_online_job_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = append_document_online_job_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Appends documents to the original document.
    # @param request AppendDocumentOnlineJobRequest
    # @return [Array<(JobHandler, Fixnum, Hash)>]
    # JobHandler, response status code and response headers
    private def append_document_online_job_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? AppendDocumentOnlineJobRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.append_document_online_job ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'JobInfo')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#append_document_online_job\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [JobHandler.new(self, request.get_original_request, data), status_code, headers]
    end

    # Applies a style to the document node.
    # @param request ApplyStyleToDocumentElementRequest
    # @return [WordsResponse]
    def apply_style_to_document_element(request)
        begin
        data, _status_code, _headers = apply_style_to_document_element_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = apply_style_to_document_element_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Applies a style to the document node.
    # @param request ApplyStyleToDocumentElementRequest
    # @return [Array<(WordsResponse, Fixnum, Hash)>]
    # WordsResponse, response status code and response headers
    private def apply_style_to_document_element_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? ApplyStyleToDocumentElementRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.apply_style_to_document_element ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'WordsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#apply_style_to_document_element\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Applies a style to the document node.
    # @param request ApplyStyleToDocumentElementOnlineRequest
    # @return [ApplyStyleToDocumentElementOnlineResponse]
    def apply_style_to_document_element_online(request)
        begin
        data, _status_code, _headers = apply_style_to_document_element_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = apply_style_to_document_element_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Applies a style to the document node.
    # @param request ApplyStyleToDocumentElementOnlineRequest
    # @return [Array<(ApplyStyleToDocumentElementOnlineResponse, Fixnum, Hash)>]
    # ApplyStyleToDocumentElementOnlineResponse, response status code and response headers
    private def apply_style_to_document_element_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? ApplyStyleToDocumentElementOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.apply_style_to_document_element_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'ApplyStyleToDocumentElementOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#apply_style_to_document_element_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = ApplyStyleToDocumentElementOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'WordsResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Executes the report generation process using the specified document template and the external data source in XML, JSON or CSV format.
    # @param request BuildReportRequest
    # @return [DocumentResponse]
    def build_report(request)
        begin
        data, _status_code, _headers = build_report_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = build_report_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Executes the report generation process using the specified document template and the external data source in XML, JSON or CSV format.
    # @param request BuildReportRequest
    # @return [Array<(DocumentResponse, Fixnum, Hash)>]
    # DocumentResponse, response status code and response headers
    private def build_report_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? BuildReportRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.build_report ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'DocumentResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#build_report\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Executes the report generation process online using the specified document template and the external data source in XML, JSON or CSV format.
    # @param request BuildReportOnlineRequest
    # @return [File]
    def build_report_online(request)
        begin
        data, _status_code, _headers = build_report_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = build_report_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Executes the report generation process online using the specified document template and the external data source in XML, JSON or CSV format.
    # @param request BuildReportOnlineRequest
    # @return [Array<(File, Fixnum, Hash)>]
    # File, response status code and response headers
    private def build_report_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? BuildReportOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.build_report_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'File')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#build_report_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Compares two documents.
    # @param request CompareDocumentRequest
    # @return [DocumentResponse]
    def compare_document(request)
        begin
        data, _status_code, _headers = compare_document_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = compare_document_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Compares two documents.
    # @param request CompareDocumentRequest
    # @return [Array<(DocumentResponse, Fixnum, Hash)>]
    # DocumentResponse, response status code and response headers
    private def compare_document_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? CompareDocumentRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.compare_document ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'DocumentResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#compare_document\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Compares two documents.
    # @param request CompareDocumentOnlineRequest
    # @return [CompareDocumentOnlineResponse]
    def compare_document_online(request)
        begin
        data, _status_code, _headers = compare_document_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = compare_document_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Compares two documents.
    # @param request CompareDocumentOnlineRequest
    # @return [Array<(CompareDocumentOnlineResponse, Fixnum, Hash)>]
    # CompareDocumentOnlineResponse, response status code and response headers
    private def compare_document_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? CompareDocumentOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.compare_document_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'CompareDocumentOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#compare_document_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = CompareDocumentOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'DocumentResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Compress and resize images inside the document.
    # The default settings allows to reduce the size of the document without any visible degradation of images quality.
    # @param request CompressDocumentRequest
    # @return [CompressResponse]
    def compress_document(request)
        begin
        data, _status_code, _headers = compress_document_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = compress_document_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Compress and resize images inside the document.
    # The default settings allows to reduce the size of the document without any visible degradation of images quality.
    # @param request CompressDocumentRequest
    # @return [Array<(CompressResponse, Fixnum, Hash)>]
    # CompressResponse, response status code and response headers
    private def compress_document_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? CompressDocumentRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.compress_document ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'CompressResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#compress_document\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Compress and resize images inside the document.
    # The default settings allows to reduce the size of the document without any visible degradation of images quality.
    # @param request CompressDocumentOnlineRequest
    # @return [CompressDocumentOnlineResponse]
    def compress_document_online(request)
        begin
        data, _status_code, _headers = compress_document_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = compress_document_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Compress and resize images inside the document.
    # The default settings allows to reduce the size of the document without any visible degradation of images quality.
    # @param request CompressDocumentOnlineRequest
    # @return [Array<(CompressDocumentOnlineResponse, Fixnum, Hash)>]
    # CompressDocumentOnlineResponse, response status code and response headers
    private def compress_document_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? CompressDocumentOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.compress_document_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'CompressDocumentOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#compress_document_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = CompressDocumentOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'CompressResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Converts a document on a local drive to the specified format.
    # @param request ConvertDocumentRequest
    # @return [File]
    def convert_document(request)
        begin
        data, _status_code, _headers = convert_document_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = convert_document_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Converts a document on a local drive to the specified format.
    # @param request ConvertDocumentRequest
    # @return [Array<(File, Fixnum, Hash)>]
    # File, response status code and response headers
    private def convert_document_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? ConvertDocumentRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.convert_document ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'File')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#convert_document\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Converts a document on a local drive to the specified format.
    # @param request ConvertDocumentJobRequest
    # @return [JobHandler]
    def convert_document_job(request)
        begin
        data, _status_code, _headers = convert_document_job_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = convert_document_job_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Converts a document on a local drive to the specified format.
    # @param request ConvertDocumentJobRequest
    # @return [Array<(JobHandler, Fixnum, Hash)>]
    # JobHandler, response status code and response headers
    private def convert_document_job_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? ConvertDocumentJobRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.convert_document_job ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'JobInfo')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#convert_document_job\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [JobHandler.new(self, request.get_original_request, data), status_code, headers]
    end

    # Copy file.
    # @param request CopyFileRequest
    # @return [nil]
    def copy_file(request)
        begin
        data, _status_code, _headers = copy_file_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = copy_file_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Copy file.
    # @param request CopyFileRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def copy_file_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? CopyFileRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.copy_file ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#copy_file\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Copy folder.
    # @param request CopyFolderRequest
    # @return [nil]
    def copy_folder(request)
        begin
        data, _status_code, _headers = copy_folder_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = copy_folder_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Copy folder.
    # @param request CopyFolderRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def copy_folder_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? CopyFolderRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.copy_folder ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#copy_folder\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Makes a copy of the style in the document.
    # @param request CopyStyleRequest
    # @return [StyleResponse]
    def copy_style(request)
        begin
        data, _status_code, _headers = copy_style_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = copy_style_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Makes a copy of the style in the document.
    # @param request CopyStyleRequest
    # @return [Array<(StyleResponse, Fixnum, Hash)>]
    # StyleResponse, response status code and response headers
    private def copy_style_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? CopyStyleRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.copy_style ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'StyleResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#copy_style\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Makes a copy of the style in the document.
    # @param request CopyStyleOnlineRequest
    # @return [CopyStyleOnlineResponse]
    def copy_style_online(request)
        begin
        data, _status_code, _headers = copy_style_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = copy_style_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Makes a copy of the style in the document.
    # @param request CopyStyleOnlineRequest
    # @return [Array<(CopyStyleOnlineResponse, Fixnum, Hash)>]
    # CopyStyleOnlineResponse, response status code and response headers
    private def copy_style_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? CopyStyleOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.copy_style_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'CopyStyleOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#copy_style_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = CopyStyleOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'StyleResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Copies styles from the origin document to the target document.
    # @param request CopyStylesFromTemplateRequest
    # @return [WordsResponse]
    def copy_styles_from_template(request)
        begin
        data, _status_code, _headers = copy_styles_from_template_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = copy_styles_from_template_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Copies styles from the origin document to the target document.
    # @param request CopyStylesFromTemplateRequest
    # @return [Array<(WordsResponse, Fixnum, Hash)>]
    # WordsResponse, response status code and response headers
    private def copy_styles_from_template_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? CopyStylesFromTemplateRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.copy_styles_from_template ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'WordsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#copy_styles_from_template\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Creates a new document in cloud storage in the format, determined by the file extension.
    # Supported all save format extensions.
    # @param request CreateDocumentRequest
    # @return [DocumentResponse]
    def create_document(request)
        begin
        data, _status_code, _headers = create_document_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = create_document_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Creates a new document in cloud storage in the format, determined by the file extension.
    # Supported all save format extensions.
    # @param request CreateDocumentRequest
    # @return [Array<(DocumentResponse, Fixnum, Hash)>]
    # DocumentResponse, response status code and response headers
    private def create_document_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? CreateDocumentRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.create_document ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'DocumentResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#create_document\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Create the folder.
    # @param request CreateFolderRequest
    # @return [nil]
    def create_folder(request)
        begin
        data, _status_code, _headers = create_folder_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = create_folder_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Create the folder.
    # @param request CreateFolderRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def create_folder_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? CreateFolderRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.create_folder ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#create_folder\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Adds a new or updates an existing document property.
    # @param request CreateOrUpdateDocumentPropertyRequest
    # @return [DocumentPropertyResponse]
    def create_or_update_document_property(request)
        begin
        data, _status_code, _headers = create_or_update_document_property_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = create_or_update_document_property_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Adds a new or updates an existing document property.
    # @param request CreateOrUpdateDocumentPropertyRequest
    # @return [Array<(DocumentPropertyResponse, Fixnum, Hash)>]
    # DocumentPropertyResponse, response status code and response headers
    private def create_or_update_document_property_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? CreateOrUpdateDocumentPropertyRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.create_or_update_document_property ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'DocumentPropertyResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#create_or_update_document_property\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Adds a new or updates an existing document property.
    # @param request CreateOrUpdateDocumentPropertyOnlineRequest
    # @return [CreateOrUpdateDocumentPropertyOnlineResponse]
    def create_or_update_document_property_online(request)
        begin
        data, _status_code, _headers = create_or_update_document_property_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = create_or_update_document_property_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Adds a new or updates an existing document property.
    # @param request CreateOrUpdateDocumentPropertyOnlineRequest
    # @return [Array<(CreateOrUpdateDocumentPropertyOnlineResponse, Fixnum, Hash)>]
    # CreateOrUpdateDocumentPropertyOnlineResponse, response status code and response headers
    private def create_or_update_document_property_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? CreateOrUpdateDocumentPropertyOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.create_or_update_document_property_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'CreateOrUpdateDocumentPropertyOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#create_or_update_document_property_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = CreateOrUpdateDocumentPropertyOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'DocumentPropertyResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Removes paragraph tab stops from the document node.
    # @param request DeleteAllParagraphTabStopsRequest
    # @return [TabStopsResponse]
    def delete_all_paragraph_tab_stops(request)
        begin
        data, _status_code, _headers = delete_all_paragraph_tab_stops_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_all_paragraph_tab_stops_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes paragraph tab stops from the document node.
    # @param request DeleteAllParagraphTabStopsRequest
    # @return [Array<(TabStopsResponse, Fixnum, Hash)>]
    # TabStopsResponse, response status code and response headers
    private def delete_all_paragraph_tab_stops_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteAllParagraphTabStopsRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_all_paragraph_tab_stops ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'TabStopsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_all_paragraph_tab_stops\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes paragraph tab stops from the document node.
    # @param request DeleteAllParagraphTabStopsOnlineRequest
    # @return [DeleteAllParagraphTabStopsOnlineResponse]
    def delete_all_paragraph_tab_stops_online(request)
        begin
        data, _status_code, _headers = delete_all_paragraph_tab_stops_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_all_paragraph_tab_stops_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes paragraph tab stops from the document node.
    # @param request DeleteAllParagraphTabStopsOnlineRequest
    # @return [Array<(DeleteAllParagraphTabStopsOnlineResponse, Fixnum, Hash)>]
    # DeleteAllParagraphTabStopsOnlineResponse, response status code and response headers
    private def delete_all_paragraph_tab_stops_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteAllParagraphTabStopsOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_all_paragraph_tab_stops_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'DeleteAllParagraphTabStopsOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_all_paragraph_tab_stops_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = DeleteAllParagraphTabStopsOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'TabStopsResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Removes a bookmark from the document.
    # @param request DeleteBookmarkRequest
    # @return [nil]
    def delete_bookmark(request)
        begin
        data, _status_code, _headers = delete_bookmark_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_bookmark_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Removes a bookmark from the document.
    # @param request DeleteBookmarkRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_bookmark_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteBookmarkRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_bookmark ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_bookmark\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes a bookmark from the document.
    # @param request DeleteBookmarkOnlineRequest
    # @return [FILES_COLLECTION]
    def delete_bookmark_online(request)
        begin
        data, _status_code, _headers = delete_bookmark_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_bookmark_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes a bookmark from the document.
    # @param request DeleteBookmarkOnlineRequest
    # @return [Array<(FILES_COLLECTION, Fixnum, Hash)>]
    # FILES_COLLECTION, response status code and response headers
    private def delete_bookmark_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteBookmarkOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_bookmark_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FILES_COLLECTION')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_bookmark_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        # FILES_COLLECTION #
        [data, status_code, headers]
    end

    # Removes all bookmarks from the document.
    # @param request DeleteBookmarksRequest
    # @return [nil]
    def delete_bookmarks(request)
        begin
        data, _status_code, _headers = delete_bookmarks_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_bookmarks_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Removes all bookmarks from the document.
    # @param request DeleteBookmarksRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_bookmarks_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteBookmarksRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_bookmarks ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_bookmarks\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes all bookmarks from the document.
    # @param request DeleteBookmarksOnlineRequest
    # @return [FILES_COLLECTION]
    def delete_bookmarks_online(request)
        begin
        data, _status_code, _headers = delete_bookmarks_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_bookmarks_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes all bookmarks from the document.
    # @param request DeleteBookmarksOnlineRequest
    # @return [Array<(FILES_COLLECTION, Fixnum, Hash)>]
    # FILES_COLLECTION, response status code and response headers
    private def delete_bookmarks_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteBookmarksOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_bookmarks_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FILES_COLLECTION')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_bookmarks_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        # FILES_COLLECTION #
        [data, status_code, headers]
    end

    # Removes a border from the document node.
    # The 'nodePath' parameter should refer to a paragraph, a cell or a row.
    # @param request DeleteBorderRequest
    # @return [BorderResponse]
    def delete_border(request)
        begin
        data, _status_code, _headers = delete_border_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_border_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes a border from the document node.
    # The 'nodePath' parameter should refer to a paragraph, a cell or a row.
    # @param request DeleteBorderRequest
    # @return [Array<(BorderResponse, Fixnum, Hash)>]
    # BorderResponse, response status code and response headers
    private def delete_border_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteBorderRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_border ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'BorderResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_border\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes a border from the document node.
    # The 'nodePath' parameter should refer to a paragraph, a cell or a row.
    # @param request DeleteBorderOnlineRequest
    # @return [DeleteBorderOnlineResponse]
    def delete_border_online(request)
        begin
        data, _status_code, _headers = delete_border_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_border_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes a border from the document node.
    # The 'nodePath' parameter should refer to a paragraph, a cell or a row.
    # @param request DeleteBorderOnlineRequest
    # @return [Array<(DeleteBorderOnlineResponse, Fixnum, Hash)>]
    # DeleteBorderOnlineResponse, response status code and response headers
    private def delete_border_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteBorderOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_border_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'DeleteBorderOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_border_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = DeleteBorderOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'BorderResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Removes borders from the document node.
    # The 'nodePath' parameter should refer to a paragraph, a cell or a row.
    # @param request DeleteBordersRequest
    # @return [BordersResponse]
    def delete_borders(request)
        begin
        data, _status_code, _headers = delete_borders_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_borders_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes borders from the document node.
    # The 'nodePath' parameter should refer to a paragraph, a cell or a row.
    # @param request DeleteBordersRequest
    # @return [Array<(BordersResponse, Fixnum, Hash)>]
    # BordersResponse, response status code and response headers
    private def delete_borders_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteBordersRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_borders ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'BordersResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_borders\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes borders from the document node.
    # The 'nodePath' parameter should refer to a paragraph, a cell or a row.
    # @param request DeleteBordersOnlineRequest
    # @return [DeleteBordersOnlineResponse]
    def delete_borders_online(request)
        begin
        data, _status_code, _headers = delete_borders_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_borders_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes borders from the document node.
    # The 'nodePath' parameter should refer to a paragraph, a cell or a row.
    # @param request DeleteBordersOnlineRequest
    # @return [Array<(DeleteBordersOnlineResponse, Fixnum, Hash)>]
    # DeleteBordersOnlineResponse, response status code and response headers
    private def delete_borders_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteBordersOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_borders_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'DeleteBordersOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_borders_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = DeleteBordersOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'BordersResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Removes a comment from the document.
    # @param request DeleteCommentRequest
    # @return [nil]
    def delete_comment(request)
        begin
        data, _status_code, _headers = delete_comment_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_comment_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Removes a comment from the document.
    # @param request DeleteCommentRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_comment_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteCommentRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_comment ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_comment\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes a comment from the document.
    # @param request DeleteCommentOnlineRequest
    # @return [FILES_COLLECTION]
    def delete_comment_online(request)
        begin
        data, _status_code, _headers = delete_comment_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_comment_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes a comment from the document.
    # @param request DeleteCommentOnlineRequest
    # @return [Array<(FILES_COLLECTION, Fixnum, Hash)>]
    # FILES_COLLECTION, response status code and response headers
    private def delete_comment_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteCommentOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_comment_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FILES_COLLECTION')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_comment_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        # FILES_COLLECTION #
        [data, status_code, headers]
    end

    # Removes all comments from the document.
    # @param request DeleteCommentsRequest
    # @return [nil]
    def delete_comments(request)
        begin
        data, _status_code, _headers = delete_comments_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_comments_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Removes all comments from the document.
    # @param request DeleteCommentsRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_comments_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteCommentsRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_comments ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_comments\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes all comments from the document.
    # @param request DeleteCommentsOnlineRequest
    # @return [FILES_COLLECTION]
    def delete_comments_online(request)
        begin
        data, _status_code, _headers = delete_comments_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_comments_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes all comments from the document.
    # @param request DeleteCommentsOnlineRequest
    # @return [Array<(FILES_COLLECTION, Fixnum, Hash)>]
    # FILES_COLLECTION, response status code and response headers
    private def delete_comments_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteCommentsOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_comments_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FILES_COLLECTION')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_comments_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        # FILES_COLLECTION #
        [data, status_code, headers]
    end

    # Removes the custom xml part from the document.
    # @param request DeleteCustomXmlPartRequest
    # @return [nil]
    def delete_custom_xml_part(request)
        begin
        data, _status_code, _headers = delete_custom_xml_part_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_custom_xml_part_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Removes the custom xml part from the document.
    # @param request DeleteCustomXmlPartRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_custom_xml_part_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteCustomXmlPartRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_custom_xml_part ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_custom_xml_part\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes the custom xml part from the document.
    # @param request DeleteCustomXmlPartOnlineRequest
    # @return [FILES_COLLECTION]
    def delete_custom_xml_part_online(request)
        begin
        data, _status_code, _headers = delete_custom_xml_part_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_custom_xml_part_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes the custom xml part from the document.
    # @param request DeleteCustomXmlPartOnlineRequest
    # @return [Array<(FILES_COLLECTION, Fixnum, Hash)>]
    # FILES_COLLECTION, response status code and response headers
    private def delete_custom_xml_part_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteCustomXmlPartOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_custom_xml_part_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FILES_COLLECTION')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_custom_xml_part_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        # FILES_COLLECTION #
        [data, status_code, headers]
    end

    # Removes all custom xml parts from the document.
    # @param request DeleteCustomXmlPartsRequest
    # @return [nil]
    def delete_custom_xml_parts(request)
        begin
        data, _status_code, _headers = delete_custom_xml_parts_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_custom_xml_parts_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Removes all custom xml parts from the document.
    # @param request DeleteCustomXmlPartsRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_custom_xml_parts_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteCustomXmlPartsRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_custom_xml_parts ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_custom_xml_parts\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes all custom xml parts from the document.
    # @param request DeleteCustomXmlPartsOnlineRequest
    # @return [FILES_COLLECTION]
    def delete_custom_xml_parts_online(request)
        begin
        data, _status_code, _headers = delete_custom_xml_parts_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_custom_xml_parts_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes all custom xml parts from the document.
    # @param request DeleteCustomXmlPartsOnlineRequest
    # @return [Array<(FILES_COLLECTION, Fixnum, Hash)>]
    # FILES_COLLECTION, response status code and response headers
    private def delete_custom_xml_parts_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteCustomXmlPartsOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_custom_xml_parts_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FILES_COLLECTION')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_custom_xml_parts_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        # FILES_COLLECTION #
        [data, status_code, headers]
    end

    # Removes a document property.
    # @param request DeleteDocumentPropertyRequest
    # @return [nil]
    def delete_document_property(request)
        begin
        data, _status_code, _headers = delete_document_property_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_document_property_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Removes a document property.
    # @param request DeleteDocumentPropertyRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_document_property_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteDocumentPropertyRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_document_property ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_document_property\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes a document property.
    # @param request DeleteDocumentPropertyOnlineRequest
    # @return [FILES_COLLECTION]
    def delete_document_property_online(request)
        begin
        data, _status_code, _headers = delete_document_property_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_document_property_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes a document property.
    # @param request DeleteDocumentPropertyOnlineRequest
    # @return [Array<(FILES_COLLECTION, Fixnum, Hash)>]
    # FILES_COLLECTION, response status code and response headers
    private def delete_document_property_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteDocumentPropertyOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_document_property_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FILES_COLLECTION')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_document_property_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        # FILES_COLLECTION #
        [data, status_code, headers]
    end

    # Removes a DrawingObject from the document node.
    # @param request DeleteDrawingObjectRequest
    # @return [nil]
    def delete_drawing_object(request)
        begin
        data, _status_code, _headers = delete_drawing_object_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_drawing_object_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Removes a DrawingObject from the document node.
    # @param request DeleteDrawingObjectRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_drawing_object_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteDrawingObjectRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_drawing_object ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_drawing_object\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes a DrawingObject from the document node.
    # @param request DeleteDrawingObjectOnlineRequest
    # @return [FILES_COLLECTION]
    def delete_drawing_object_online(request)
        begin
        data, _status_code, _headers = delete_drawing_object_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_drawing_object_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes a DrawingObject from the document node.
    # @param request DeleteDrawingObjectOnlineRequest
    # @return [Array<(FILES_COLLECTION, Fixnum, Hash)>]
    # FILES_COLLECTION, response status code and response headers
    private def delete_drawing_object_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteDrawingObjectOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_drawing_object_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FILES_COLLECTION')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_drawing_object_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        # FILES_COLLECTION #
        [data, status_code, headers]
    end

    # Removes a field from the document node.
    # @param request DeleteFieldRequest
    # @return [nil]
    def delete_field(request)
        begin
        data, _status_code, _headers = delete_field_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_field_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Removes a field from the document node.
    # @param request DeleteFieldRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_field_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteFieldRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_field ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_field\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes a field from the document node.
    # @param request DeleteFieldOnlineRequest
    # @return [FILES_COLLECTION]
    def delete_field_online(request)
        begin
        data, _status_code, _headers = delete_field_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_field_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes a field from the document node.
    # @param request DeleteFieldOnlineRequest
    # @return [Array<(FILES_COLLECTION, Fixnum, Hash)>]
    # FILES_COLLECTION, response status code and response headers
    private def delete_field_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteFieldOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_field_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FILES_COLLECTION')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_field_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        # FILES_COLLECTION #
        [data, status_code, headers]
    end

    # Removes fields from the document node.
    # @param request DeleteFieldsRequest
    # @return [nil]
    def delete_fields(request)
        begin
        data, _status_code, _headers = delete_fields_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_fields_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Removes fields from the document node.
    # @param request DeleteFieldsRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_fields_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteFieldsRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_fields ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_fields\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes fields from the document node.
    # @param request DeleteFieldsOnlineRequest
    # @return [FILES_COLLECTION]
    def delete_fields_online(request)
        begin
        data, _status_code, _headers = delete_fields_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_fields_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes fields from the document node.
    # @param request DeleteFieldsOnlineRequest
    # @return [Array<(FILES_COLLECTION, Fixnum, Hash)>]
    # FILES_COLLECTION, response status code and response headers
    private def delete_fields_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteFieldsOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_fields_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FILES_COLLECTION')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_fields_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        # FILES_COLLECTION #
        [data, status_code, headers]
    end

    # Delete file.
    # @param request DeleteFileRequest
    # @return [nil]
    def delete_file(request)
        begin
        data, _status_code, _headers = delete_file_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_file_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Delete file.
    # @param request DeleteFileRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_file_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteFileRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_file ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_file\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Delete folder.
    # @param request DeleteFolderRequest
    # @return [nil]
    def delete_folder(request)
        begin
        data, _status_code, _headers = delete_folder_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_folder_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Delete folder.
    # @param request DeleteFolderRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_folder_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteFolderRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_folder ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_folder\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes a footnote from the document node.
    # @param request DeleteFootnoteRequest
    # @return [nil]
    def delete_footnote(request)
        begin
        data, _status_code, _headers = delete_footnote_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_footnote_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Removes a footnote from the document node.
    # @param request DeleteFootnoteRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_footnote_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteFootnoteRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_footnote ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_footnote\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes a footnote from the document node.
    # @param request DeleteFootnoteOnlineRequest
    # @return [FILES_COLLECTION]
    def delete_footnote_online(request)
        begin
        data, _status_code, _headers = delete_footnote_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_footnote_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes a footnote from the document node.
    # @param request DeleteFootnoteOnlineRequest
    # @return [Array<(FILES_COLLECTION, Fixnum, Hash)>]
    # FILES_COLLECTION, response status code and response headers
    private def delete_footnote_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteFootnoteOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_footnote_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FILES_COLLECTION')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_footnote_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        # FILES_COLLECTION #
        [data, status_code, headers]
    end

    # Removes a form field from the document node.
    # @param request DeleteFormFieldRequest
    # @return [nil]
    def delete_form_field(request)
        begin
        data, _status_code, _headers = delete_form_field_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_form_field_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Removes a form field from the document node.
    # @param request DeleteFormFieldRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_form_field_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteFormFieldRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_form_field ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_form_field\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes a form field from the document node.
    # @param request DeleteFormFieldOnlineRequest
    # @return [FILES_COLLECTION]
    def delete_form_field_online(request)
        begin
        data, _status_code, _headers = delete_form_field_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_form_field_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes a form field from the document node.
    # @param request DeleteFormFieldOnlineRequest
    # @return [Array<(FILES_COLLECTION, Fixnum, Hash)>]
    # FILES_COLLECTION, response status code and response headers
    private def delete_form_field_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteFormFieldOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_form_field_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FILES_COLLECTION')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_form_field_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        # FILES_COLLECTION #
        [data, status_code, headers]
    end

    # Removes a HeaderFooter object from the document section.
    # @param request DeleteHeaderFooterRequest
    # @return [nil]
    def delete_header_footer(request)
        begin
        data, _status_code, _headers = delete_header_footer_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_header_footer_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Removes a HeaderFooter object from the document section.
    # @param request DeleteHeaderFooterRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_header_footer_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteHeaderFooterRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_header_footer ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_header_footer\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes a HeaderFooter object from the document section.
    # @param request DeleteHeaderFooterOnlineRequest
    # @return [FILES_COLLECTION]
    def delete_header_footer_online(request)
        begin
        data, _status_code, _headers = delete_header_footer_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_header_footer_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes a HeaderFooter object from the document section.
    # @param request DeleteHeaderFooterOnlineRequest
    # @return [Array<(FILES_COLLECTION, Fixnum, Hash)>]
    # FILES_COLLECTION, response status code and response headers
    private def delete_header_footer_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteHeaderFooterOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_header_footer_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FILES_COLLECTION')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_header_footer_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        # FILES_COLLECTION #
        [data, status_code, headers]
    end

    # Removes HeaderFooter objects from the document section.
    # @param request DeleteHeadersFootersRequest
    # @return [nil]
    def delete_headers_footers(request)
        begin
        data, _status_code, _headers = delete_headers_footers_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_headers_footers_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Removes HeaderFooter objects from the document section.
    # @param request DeleteHeadersFootersRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_headers_footers_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteHeadersFootersRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_headers_footers ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_headers_footers\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes HeaderFooter objects from the document section.
    # @param request DeleteHeadersFootersOnlineRequest
    # @return [FILES_COLLECTION]
    def delete_headers_footers_online(request)
        begin
        data, _status_code, _headers = delete_headers_footers_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_headers_footers_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes HeaderFooter objects from the document section.
    # @param request DeleteHeadersFootersOnlineRequest
    # @return [Array<(FILES_COLLECTION, Fixnum, Hash)>]
    # FILES_COLLECTION, response status code and response headers
    private def delete_headers_footers_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteHeadersFootersOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_headers_footers_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FILES_COLLECTION')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_headers_footers_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        # FILES_COLLECTION #
        [data, status_code, headers]
    end

    # Removes macros from the document.
    # @param request DeleteMacrosRequest
    # @return [nil]
    def delete_macros(request)
        begin
        data, _status_code, _headers = delete_macros_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_macros_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Removes macros from the document.
    # @param request DeleteMacrosRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_macros_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteMacrosRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_macros ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_macros\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes macros from the document.
    # @param request DeleteMacrosOnlineRequest
    # @return [FILES_COLLECTION]
    def delete_macros_online(request)
        begin
        data, _status_code, _headers = delete_macros_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_macros_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes macros from the document.
    # @param request DeleteMacrosOnlineRequest
    # @return [Array<(FILES_COLLECTION, Fixnum, Hash)>]
    # FILES_COLLECTION, response status code and response headers
    private def delete_macros_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteMacrosOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_macros_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FILES_COLLECTION')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_macros_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        # FILES_COLLECTION #
        [data, status_code, headers]
    end

    # Removes an OfficeMath object from the document node.
    # @param request DeleteOfficeMathObjectRequest
    # @return [nil]
    def delete_office_math_object(request)
        begin
        data, _status_code, _headers = delete_office_math_object_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_office_math_object_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Removes an OfficeMath object from the document node.
    # @param request DeleteOfficeMathObjectRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_office_math_object_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteOfficeMathObjectRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_office_math_object ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_office_math_object\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes an OfficeMath object from the document node.
    # @param request DeleteOfficeMathObjectOnlineRequest
    # @return [FILES_COLLECTION]
    def delete_office_math_object_online(request)
        begin
        data, _status_code, _headers = delete_office_math_object_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_office_math_object_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes an OfficeMath object from the document node.
    # @param request DeleteOfficeMathObjectOnlineRequest
    # @return [Array<(FILES_COLLECTION, Fixnum, Hash)>]
    # FILES_COLLECTION, response status code and response headers
    private def delete_office_math_object_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteOfficeMathObjectOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_office_math_object_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FILES_COLLECTION')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_office_math_object_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        # FILES_COLLECTION #
        [data, status_code, headers]
    end

    # Removes all office math objects from the document.
    # @param request DeleteOfficeMathObjectsRequest
    # @return [nil]
    def delete_office_math_objects(request)
        begin
        data, _status_code, _headers = delete_office_math_objects_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_office_math_objects_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Removes all office math objects from the document.
    # @param request DeleteOfficeMathObjectsRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_office_math_objects_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteOfficeMathObjectsRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_office_math_objects ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_office_math_objects\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes all office math objects from the document.
    # @param request DeleteOfficeMathObjectsOnlineRequest
    # @return [FILES_COLLECTION]
    def delete_office_math_objects_online(request)
        begin
        data, _status_code, _headers = delete_office_math_objects_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_office_math_objects_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes all office math objects from the document.
    # @param request DeleteOfficeMathObjectsOnlineRequest
    # @return [Array<(FILES_COLLECTION, Fixnum, Hash)>]
    # FILES_COLLECTION, response status code and response headers
    private def delete_office_math_objects_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteOfficeMathObjectsOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_office_math_objects_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FILES_COLLECTION')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_office_math_objects_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        # FILES_COLLECTION #
        [data, status_code, headers]
    end

    # Removes a paragraph from the document node.
    # @param request DeleteParagraphRequest
    # @return [nil]
    def delete_paragraph(request)
        begin
        data, _status_code, _headers = delete_paragraph_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_paragraph_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Removes a paragraph from the document node.
    # @param request DeleteParagraphRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_paragraph_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteParagraphRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_paragraph ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_paragraph\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes the formatting properties of a paragraph list from the document node.
    # @param request DeleteParagraphListFormatRequest
    # @return [ParagraphListFormatResponse]
    def delete_paragraph_list_format(request)
        begin
        data, _status_code, _headers = delete_paragraph_list_format_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_paragraph_list_format_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes the formatting properties of a paragraph list from the document node.
    # @param request DeleteParagraphListFormatRequest
    # @return [Array<(ParagraphListFormatResponse, Fixnum, Hash)>]
    # ParagraphListFormatResponse, response status code and response headers
    private def delete_paragraph_list_format_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteParagraphListFormatRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_paragraph_list_format ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'ParagraphListFormatResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_paragraph_list_format\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes the formatting properties of a paragraph list from the document node.
    # @param request DeleteParagraphListFormatOnlineRequest
    # @return [DeleteParagraphListFormatOnlineResponse]
    def delete_paragraph_list_format_online(request)
        begin
        data, _status_code, _headers = delete_paragraph_list_format_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_paragraph_list_format_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes the formatting properties of a paragraph list from the document node.
    # @param request DeleteParagraphListFormatOnlineRequest
    # @return [Array<(DeleteParagraphListFormatOnlineResponse, Fixnum, Hash)>]
    # DeleteParagraphListFormatOnlineResponse, response status code and response headers
    private def delete_paragraph_list_format_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteParagraphListFormatOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_paragraph_list_format_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'DeleteParagraphListFormatOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_paragraph_list_format_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = DeleteParagraphListFormatOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'ParagraphListFormatResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Removes a paragraph from the document node.
    # @param request DeleteParagraphOnlineRequest
    # @return [FILES_COLLECTION]
    def delete_paragraph_online(request)
        begin
        data, _status_code, _headers = delete_paragraph_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_paragraph_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes a paragraph from the document node.
    # @param request DeleteParagraphOnlineRequest
    # @return [Array<(FILES_COLLECTION, Fixnum, Hash)>]
    # FILES_COLLECTION, response status code and response headers
    private def delete_paragraph_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteParagraphOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_paragraph_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FILES_COLLECTION')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_paragraph_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        # FILES_COLLECTION #
        [data, status_code, headers]
    end

    # Removes a paragraph tab stop from the document node.
    # @param request DeleteParagraphTabStopRequest
    # @return [TabStopsResponse]
    def delete_paragraph_tab_stop(request)
        begin
        data, _status_code, _headers = delete_paragraph_tab_stop_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_paragraph_tab_stop_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes a paragraph tab stop from the document node.
    # @param request DeleteParagraphTabStopRequest
    # @return [Array<(TabStopsResponse, Fixnum, Hash)>]
    # TabStopsResponse, response status code and response headers
    private def delete_paragraph_tab_stop_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteParagraphTabStopRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_paragraph_tab_stop ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'TabStopsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_paragraph_tab_stop\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes a paragraph tab stop from the document node.
    # @param request DeleteParagraphTabStopOnlineRequest
    # @return [DeleteParagraphTabStopOnlineResponse]
    def delete_paragraph_tab_stop_online(request)
        begin
        data, _status_code, _headers = delete_paragraph_tab_stop_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_paragraph_tab_stop_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes a paragraph tab stop from the document node.
    # @param request DeleteParagraphTabStopOnlineRequest
    # @return [Array<(DeleteParagraphTabStopOnlineResponse, Fixnum, Hash)>]
    # DeleteParagraphTabStopOnlineResponse, response status code and response headers
    private def delete_paragraph_tab_stop_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteParagraphTabStopOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_paragraph_tab_stop_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'DeleteParagraphTabStopOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_paragraph_tab_stop_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = DeleteParagraphTabStopOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'TabStopsResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Removes a Run object from the paragraph.
    # @param request DeleteRunRequest
    # @return [nil]
    def delete_run(request)
        begin
        data, _status_code, _headers = delete_run_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_run_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Removes a Run object from the paragraph.
    # @param request DeleteRunRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_run_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteRunRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_run ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_run\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes a Run object from the paragraph.
    # @param request DeleteRunOnlineRequest
    # @return [FILES_COLLECTION]
    def delete_run_online(request)
        begin
        data, _status_code, _headers = delete_run_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_run_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes a Run object from the paragraph.
    # @param request DeleteRunOnlineRequest
    # @return [Array<(FILES_COLLECTION, Fixnum, Hash)>]
    # FILES_COLLECTION, response status code and response headers
    private def delete_run_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteRunOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_run_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FILES_COLLECTION')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_run_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        # FILES_COLLECTION #
        [data, status_code, headers]
    end

    # Removes a section from the document.
    # @param request DeleteSectionRequest
    # @return [nil]
    def delete_section(request)
        begin
        data, _status_code, _headers = delete_section_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_section_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Removes a section from the document.
    # @param request DeleteSectionRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_section_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteSectionRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_section ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_section\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes a section from the document.
    # @param request DeleteSectionOnlineRequest
    # @return [FILES_COLLECTION]
    def delete_section_online(request)
        begin
        data, _status_code, _headers = delete_section_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_section_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes a section from the document.
    # @param request DeleteSectionOnlineRequest
    # @return [Array<(FILES_COLLECTION, Fixnum, Hash)>]
    # FILES_COLLECTION, response status code and response headers
    private def delete_section_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteSectionOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_section_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FILES_COLLECTION')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_section_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        # FILES_COLLECTION #
        [data, status_code, headers]
    end

    # Removes a StructuredDocumentTag (SDT) from the document node.
    # @param request DeleteStructuredDocumentTagRequest
    # @return [nil]
    def delete_structured_document_tag(request)
        begin
        data, _status_code, _headers = delete_structured_document_tag_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_structured_document_tag_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Removes a StructuredDocumentTag (SDT) from the document node.
    # @param request DeleteStructuredDocumentTagRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_structured_document_tag_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteStructuredDocumentTagRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_structured_document_tag ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_structured_document_tag\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes a StructuredDocumentTag (SDT) from the document node.
    # @param request DeleteStructuredDocumentTagOnlineRequest
    # @return [FILES_COLLECTION]
    def delete_structured_document_tag_online(request)
        begin
        data, _status_code, _headers = delete_structured_document_tag_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_structured_document_tag_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes a StructuredDocumentTag (SDT) from the document node.
    # @param request DeleteStructuredDocumentTagOnlineRequest
    # @return [Array<(FILES_COLLECTION, Fixnum, Hash)>]
    # FILES_COLLECTION, response status code and response headers
    private def delete_structured_document_tag_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteStructuredDocumentTagOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_structured_document_tag_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FILES_COLLECTION')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_structured_document_tag_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        # FILES_COLLECTION #
        [data, status_code, headers]
    end

    # Removes a table from the document node.
    # @param request DeleteTableRequest
    # @return [nil]
    def delete_table(request)
        begin
        data, _status_code, _headers = delete_table_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_table_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Removes a table from the document node.
    # @param request DeleteTableRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_table_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteTableRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_table ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_table\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes a cell from the table row.
    # @param request DeleteTableCellRequest
    # @return [nil]
    def delete_table_cell(request)
        begin
        data, _status_code, _headers = delete_table_cell_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_table_cell_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Removes a cell from the table row.
    # @param request DeleteTableCellRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_table_cell_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteTableCellRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_table_cell ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_table_cell\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes a cell from the table row.
    # @param request DeleteTableCellOnlineRequest
    # @return [FILES_COLLECTION]
    def delete_table_cell_online(request)
        begin
        data, _status_code, _headers = delete_table_cell_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_table_cell_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes a cell from the table row.
    # @param request DeleteTableCellOnlineRequest
    # @return [Array<(FILES_COLLECTION, Fixnum, Hash)>]
    # FILES_COLLECTION, response status code and response headers
    private def delete_table_cell_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteTableCellOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_table_cell_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FILES_COLLECTION')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_table_cell_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        # FILES_COLLECTION #
        [data, status_code, headers]
    end

    # Removes a table from the document node.
    # @param request DeleteTableOnlineRequest
    # @return [FILES_COLLECTION]
    def delete_table_online(request)
        begin
        data, _status_code, _headers = delete_table_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_table_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes a table from the document node.
    # @param request DeleteTableOnlineRequest
    # @return [Array<(FILES_COLLECTION, Fixnum, Hash)>]
    # FILES_COLLECTION, response status code and response headers
    private def delete_table_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteTableOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_table_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FILES_COLLECTION')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_table_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        # FILES_COLLECTION #
        [data, status_code, headers]
    end

    # Removes a row from the table.
    # @param request DeleteTableRowRequest
    # @return [nil]
    def delete_table_row(request)
        begin
        data, _status_code, _headers = delete_table_row_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_table_row_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Removes a row from the table.
    # @param request DeleteTableRowRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_table_row_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteTableRowRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_table_row ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_table_row\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes a row from the table.
    # @param request DeleteTableRowOnlineRequest
    # @return [FILES_COLLECTION]
    def delete_table_row_online(request)
        begin
        data, _status_code, _headers = delete_table_row_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_table_row_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes a row from the table.
    # @param request DeleteTableRowOnlineRequest
    # @return [Array<(FILES_COLLECTION, Fixnum, Hash)>]
    # FILES_COLLECTION, response status code and response headers
    private def delete_table_row_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteTableRowOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_table_row_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FILES_COLLECTION')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_table_row_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        # FILES_COLLECTION #
        [data, status_code, headers]
    end

    # Removes a watermark from the document.
    # @param request DeleteWatermarkRequest
    # @return [DocumentResponse]
    def delete_watermark(request)
        begin
        data, _status_code, _headers = delete_watermark_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_watermark_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes a watermark from the document.
    # @param request DeleteWatermarkRequest
    # @return [Array<(DocumentResponse, Fixnum, Hash)>]
    # DocumentResponse, response status code and response headers
    private def delete_watermark_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteWatermarkRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_watermark ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'DocumentResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_watermark\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes a watermark from the document.
    # @param request DeleteWatermarkOnlineRequest
    # @return [DeleteWatermarkOnlineResponse]
    def delete_watermark_online(request)
        begin
        data, _status_code, _headers = delete_watermark_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = delete_watermark_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes a watermark from the document.
    # @param request DeleteWatermarkOnlineRequest
    # @return [Array<(DeleteWatermarkOnlineResponse, Fixnum, Hash)>]
    # DeleteWatermarkOnlineResponse, response status code and response headers
    private def delete_watermark_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteWatermarkOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.delete_watermark_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'DeleteWatermarkOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#delete_watermark_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = DeleteWatermarkOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'DocumentResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Download file.
    # @param request DownloadFileRequest
    # @return [File]
    def download_file(request)
        begin
        data, _status_code, _headers = download_file_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = download_file_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Download file.
    # @param request DownloadFileRequest
    # @return [Array<(File, Fixnum, Hash)>]
    # File, response status code and response headers
    private def download_file_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? DownloadFileRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.download_file ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'File')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#download_file\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Executes a Mail Merge operation.
    # @param request ExecuteMailMergeRequest
    # @return [DocumentResponse]
    def execute_mail_merge(request)
        begin
        data, _status_code, _headers = execute_mail_merge_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = execute_mail_merge_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Executes a Mail Merge operation.
    # @param request ExecuteMailMergeRequest
    # @return [Array<(DocumentResponse, Fixnum, Hash)>]
    # DocumentResponse, response status code and response headers
    private def execute_mail_merge_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? ExecuteMailMergeRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.execute_mail_merge ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'DocumentResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#execute_mail_merge\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Executes a Mail Merge operation.
    # @param request ExecuteMailMergeJobRequest
    # @return [JobHandler]
    def execute_mail_merge_job(request)
        begin
        data, _status_code, _headers = execute_mail_merge_job_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = execute_mail_merge_job_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Executes a Mail Merge operation.
    # @param request ExecuteMailMergeJobRequest
    # @return [Array<(JobHandler, Fixnum, Hash)>]
    # JobHandler, response status code and response headers
    private def execute_mail_merge_job_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? ExecuteMailMergeJobRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.execute_mail_merge_job ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'JobInfo')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#execute_mail_merge_job\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [JobHandler.new(self, request.get_original_request, data), status_code, headers]
    end

    # Executes a Mail Merge operation online.
    # @param request ExecuteMailMergeOnlineRequest
    # @return [File]
    def execute_mail_merge_online(request)
        begin
        data, _status_code, _headers = execute_mail_merge_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = execute_mail_merge_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Executes a Mail Merge operation online.
    # @param request ExecuteMailMergeOnlineRequest
    # @return [Array<(File, Fixnum, Hash)>]
    # File, response status code and response headers
    private def execute_mail_merge_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? ExecuteMailMergeOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.execute_mail_merge_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'File')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#execute_mail_merge_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Executes a Mail Merge operation online.
    # @param request ExecuteMailMergeOnlineJobRequest
    # @return [JobHandler]
    def execute_mail_merge_online_job(request)
        begin
        data, _status_code, _headers = execute_mail_merge_online_job_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = execute_mail_merge_online_job_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Executes a Mail Merge operation online.
    # @param request ExecuteMailMergeOnlineJobRequest
    # @return [Array<(JobHandler, Fixnum, Hash)>]
    # JobHandler, response status code and response headers
    private def execute_mail_merge_online_job_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? ExecuteMailMergeOnlineJobRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.execute_mail_merge_online_job ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'JobInfo')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#execute_mail_merge_online_job\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [JobHandler.new(self, request.get_original_request, data), status_code, headers]
    end

    # Get all information about revisions.
    # @param request GetAllRevisionsRequest
    # @return [RevisionsResponse]
    def get_all_revisions(request)
        begin
        data, _status_code, _headers = get_all_revisions_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_all_revisions_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Get all information about revisions.
    # @param request GetAllRevisionsRequest
    # @return [Array<(RevisionsResponse, Fixnum, Hash)>]
    # RevisionsResponse, response status code and response headers
    private def get_all_revisions_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetAllRevisionsRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_all_revisions ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'RevisionsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_all_revisions\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Get all information about revisions.
    # @param request GetAllRevisionsOnlineRequest
    # @return [RevisionsResponse]
    def get_all_revisions_online(request)
        begin
        data, _status_code, _headers = get_all_revisions_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_all_revisions_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Get all information about revisions.
    # @param request GetAllRevisionsOnlineRequest
    # @return [Array<(RevisionsResponse, Fixnum, Hash)>]
    # RevisionsResponse, response status code and response headers
    private def get_all_revisions_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetAllRevisionsOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_all_revisions_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'RevisionsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_all_revisions_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads available fonts from the document.
    # @param request GetAvailableFontsRequest
    # @return [AvailableFontsResponse]
    def get_available_fonts(request)
        begin
        data, _status_code, _headers = get_available_fonts_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_available_fonts_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads available fonts from the document.
    # @param request GetAvailableFontsRequest
    # @return [Array<(AvailableFontsResponse, Fixnum, Hash)>]
    # AvailableFontsResponse, response status code and response headers
    private def get_available_fonts_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetAvailableFontsRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_available_fonts ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'AvailableFontsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_available_fonts\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a bookmark, specified by name, from the document.
    # @param request GetBookmarkByNameRequest
    # @return [BookmarkResponse]
    def get_bookmark_by_name(request)
        begin
        data, _status_code, _headers = get_bookmark_by_name_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_bookmark_by_name_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a bookmark, specified by name, from the document.
    # @param request GetBookmarkByNameRequest
    # @return [Array<(BookmarkResponse, Fixnum, Hash)>]
    # BookmarkResponse, response status code and response headers
    private def get_bookmark_by_name_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetBookmarkByNameRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_bookmark_by_name ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'BookmarkResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_bookmark_by_name\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a bookmark, specified by name, from the document.
    # @param request GetBookmarkByNameOnlineRequest
    # @return [BookmarkResponse]
    def get_bookmark_by_name_online(request)
        begin
        data, _status_code, _headers = get_bookmark_by_name_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_bookmark_by_name_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a bookmark, specified by name, from the document.
    # @param request GetBookmarkByNameOnlineRequest
    # @return [Array<(BookmarkResponse, Fixnum, Hash)>]
    # BookmarkResponse, response status code and response headers
    private def get_bookmark_by_name_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetBookmarkByNameOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_bookmark_by_name_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'BookmarkResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_bookmark_by_name_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads bookmarks from the document.
    # @param request GetBookmarksRequest
    # @return [BookmarksResponse]
    def get_bookmarks(request)
        begin
        data, _status_code, _headers = get_bookmarks_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_bookmarks_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads bookmarks from the document.
    # @param request GetBookmarksRequest
    # @return [Array<(BookmarksResponse, Fixnum, Hash)>]
    # BookmarksResponse, response status code and response headers
    private def get_bookmarks_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetBookmarksRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_bookmarks ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'BookmarksResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_bookmarks\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads bookmarks from the document.
    # @param request GetBookmarksOnlineRequest
    # @return [BookmarksResponse]
    def get_bookmarks_online(request)
        begin
        data, _status_code, _headers = get_bookmarks_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_bookmarks_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads bookmarks from the document.
    # @param request GetBookmarksOnlineRequest
    # @return [Array<(BookmarksResponse, Fixnum, Hash)>]
    # BookmarksResponse, response status code and response headers
    private def get_bookmarks_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetBookmarksOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_bookmarks_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'BookmarksResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_bookmarks_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a border from the document node.
    # The 'nodePath' parameter should refer to a paragraph, a cell or a row.
    # @param request GetBorderRequest
    # @return [BorderResponse]
    def get_border(request)
        begin
        data, _status_code, _headers = get_border_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_border_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a border from the document node.
    # The 'nodePath' parameter should refer to a paragraph, a cell or a row.
    # @param request GetBorderRequest
    # @return [Array<(BorderResponse, Fixnum, Hash)>]
    # BorderResponse, response status code and response headers
    private def get_border_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetBorderRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_border ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'BorderResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_border\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a border from the document node.
    # The 'nodePath' parameter should refer to a paragraph, a cell or a row.
    # @param request GetBorderOnlineRequest
    # @return [BorderResponse]
    def get_border_online(request)
        begin
        data, _status_code, _headers = get_border_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_border_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a border from the document node.
    # The 'nodePath' parameter should refer to a paragraph, a cell or a row.
    # @param request GetBorderOnlineRequest
    # @return [Array<(BorderResponse, Fixnum, Hash)>]
    # BorderResponse, response status code and response headers
    private def get_border_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetBorderOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_border_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'BorderResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_border_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads borders from the document node.
    # @param request GetBordersRequest
    # @return [BordersResponse]
    def get_borders(request)
        begin
        data, _status_code, _headers = get_borders_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_borders_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads borders from the document node.
    # @param request GetBordersRequest
    # @return [Array<(BordersResponse, Fixnum, Hash)>]
    # BordersResponse, response status code and response headers
    private def get_borders_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetBordersRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_borders ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'BordersResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_borders\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads borders from the document node.
    # @param request GetBordersOnlineRequest
    # @return [BordersResponse]
    def get_borders_online(request)
        begin
        data, _status_code, _headers = get_borders_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_borders_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads borders from the document node.
    # @param request GetBordersOnlineRequest
    # @return [Array<(BordersResponse, Fixnum, Hash)>]
    # BordersResponse, response status code and response headers
    private def get_borders_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetBordersOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_borders_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'BordersResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_borders_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a comment from the document.
    # @param request GetCommentRequest
    # @return [CommentResponse]
    def get_comment(request)
        begin
        data, _status_code, _headers = get_comment_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_comment_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a comment from the document.
    # @param request GetCommentRequest
    # @return [Array<(CommentResponse, Fixnum, Hash)>]
    # CommentResponse, response status code and response headers
    private def get_comment_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetCommentRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_comment ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'CommentResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_comment\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a comment from the document.
    # @param request GetCommentOnlineRequest
    # @return [CommentResponse]
    def get_comment_online(request)
        begin
        data, _status_code, _headers = get_comment_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_comment_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a comment from the document.
    # @param request GetCommentOnlineRequest
    # @return [Array<(CommentResponse, Fixnum, Hash)>]
    # CommentResponse, response status code and response headers
    private def get_comment_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetCommentOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_comment_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'CommentResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_comment_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads comments from the document.
    # @param request GetCommentsRequest
    # @return [CommentsResponse]
    def get_comments(request)
        begin
        data, _status_code, _headers = get_comments_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_comments_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads comments from the document.
    # @param request GetCommentsRequest
    # @return [Array<(CommentsResponse, Fixnum, Hash)>]
    # CommentsResponse, response status code and response headers
    private def get_comments_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetCommentsRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_comments ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'CommentsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_comments\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads comments from the document.
    # @param request GetCommentsOnlineRequest
    # @return [CommentsResponse]
    def get_comments_online(request)
        begin
        data, _status_code, _headers = get_comments_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_comments_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads comments from the document.
    # @param request GetCommentsOnlineRequest
    # @return [Array<(CommentsResponse, Fixnum, Hash)>]
    # CommentsResponse, response status code and response headers
    private def get_comments_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetCommentsOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_comments_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'CommentsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_comments_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads the custom xml part from the document.
    # @param request GetCustomXmlPartRequest
    # @return [CustomXmlPartResponse]
    def get_custom_xml_part(request)
        begin
        data, _status_code, _headers = get_custom_xml_part_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_custom_xml_part_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads the custom xml part from the document.
    # @param request GetCustomXmlPartRequest
    # @return [Array<(CustomXmlPartResponse, Fixnum, Hash)>]
    # CustomXmlPartResponse, response status code and response headers
    private def get_custom_xml_part_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetCustomXmlPartRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_custom_xml_part ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'CustomXmlPartResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_custom_xml_part\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads the custom xml part from the document.
    # @param request GetCustomXmlPartOnlineRequest
    # @return [CustomXmlPartResponse]
    def get_custom_xml_part_online(request)
        begin
        data, _status_code, _headers = get_custom_xml_part_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_custom_xml_part_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads the custom xml part from the document.
    # @param request GetCustomXmlPartOnlineRequest
    # @return [Array<(CustomXmlPartResponse, Fixnum, Hash)>]
    # CustomXmlPartResponse, response status code and response headers
    private def get_custom_xml_part_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetCustomXmlPartOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_custom_xml_part_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'CustomXmlPartResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_custom_xml_part_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads custom xml parts from the document.
    # @param request GetCustomXmlPartsRequest
    # @return [CustomXmlPartsResponse]
    def get_custom_xml_parts(request)
        begin
        data, _status_code, _headers = get_custom_xml_parts_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_custom_xml_parts_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads custom xml parts from the document.
    # @param request GetCustomXmlPartsRequest
    # @return [Array<(CustomXmlPartsResponse, Fixnum, Hash)>]
    # CustomXmlPartsResponse, response status code and response headers
    private def get_custom_xml_parts_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetCustomXmlPartsRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_custom_xml_parts ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'CustomXmlPartsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_custom_xml_parts\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads custom xml parts from the document.
    # @param request GetCustomXmlPartsOnlineRequest
    # @return [CustomXmlPartsResponse]
    def get_custom_xml_parts_online(request)
        begin
        data, _status_code, _headers = get_custom_xml_parts_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_custom_xml_parts_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads custom xml parts from the document.
    # @param request GetCustomXmlPartsOnlineRequest
    # @return [Array<(CustomXmlPartsResponse, Fixnum, Hash)>]
    # CustomXmlPartsResponse, response status code and response headers
    private def get_custom_xml_parts_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetCustomXmlPartsOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_custom_xml_parts_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'CustomXmlPartsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_custom_xml_parts_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads common information from the document.
    # @param request GetDocumentRequest
    # @return [DocumentResponse]
    def get_document(request)
        begin
        data, _status_code, _headers = get_document_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_document_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads common information from the document.
    # @param request GetDocumentRequest
    # @return [Array<(DocumentResponse, Fixnum, Hash)>]
    # DocumentResponse, response status code and response headers
    private def get_document_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetDocumentRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_document ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'DocumentResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_document\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a DrawingObject from the document node.
    # @param request GetDocumentDrawingObjectByIndexRequest
    # @return [DrawingObjectResponse]
    def get_document_drawing_object_by_index(request)
        begin
        data, _status_code, _headers = get_document_drawing_object_by_index_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_document_drawing_object_by_index_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a DrawingObject from the document node.
    # @param request GetDocumentDrawingObjectByIndexRequest
    # @return [Array<(DrawingObjectResponse, Fixnum, Hash)>]
    # DrawingObjectResponse, response status code and response headers
    private def get_document_drawing_object_by_index_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetDocumentDrawingObjectByIndexRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_document_drawing_object_by_index ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'DrawingObjectResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_document_drawing_object_by_index\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a DrawingObject from the document node.
    # @param request GetDocumentDrawingObjectByIndexOnlineRequest
    # @return [DrawingObjectResponse]
    def get_document_drawing_object_by_index_online(request)
        begin
        data, _status_code, _headers = get_document_drawing_object_by_index_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_document_drawing_object_by_index_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a DrawingObject from the document node.
    # @param request GetDocumentDrawingObjectByIndexOnlineRequest
    # @return [Array<(DrawingObjectResponse, Fixnum, Hash)>]
    # DrawingObjectResponse, response status code and response headers
    private def get_document_drawing_object_by_index_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetDocumentDrawingObjectByIndexOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_document_drawing_object_by_index_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'DrawingObjectResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_document_drawing_object_by_index_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads image data of a DrawingObject from the document node.
    # @param request GetDocumentDrawingObjectImageDataRequest
    # @return [File]
    def get_document_drawing_object_image_data(request)
        begin
        data, _status_code, _headers = get_document_drawing_object_image_data_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_document_drawing_object_image_data_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads image data of a DrawingObject from the document node.
    # @param request GetDocumentDrawingObjectImageDataRequest
    # @return [Array<(File, Fixnum, Hash)>]
    # File, response status code and response headers
    private def get_document_drawing_object_image_data_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetDocumentDrawingObjectImageDataRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_document_drawing_object_image_data ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'File')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_document_drawing_object_image_data\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads image data of a DrawingObject from the document node.
    # @param request GetDocumentDrawingObjectImageDataOnlineRequest
    # @return [File]
    def get_document_drawing_object_image_data_online(request)
        begin
        data, _status_code, _headers = get_document_drawing_object_image_data_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_document_drawing_object_image_data_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads image data of a DrawingObject from the document node.
    # @param request GetDocumentDrawingObjectImageDataOnlineRequest
    # @return [Array<(File, Fixnum, Hash)>]
    # File, response status code and response headers
    private def get_document_drawing_object_image_data_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetDocumentDrawingObjectImageDataOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_document_drawing_object_image_data_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'File')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_document_drawing_object_image_data_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads OLE data of a DrawingObject from the document node.
    # @param request GetDocumentDrawingObjectOleDataRequest
    # @return [File]
    def get_document_drawing_object_ole_data(request)
        begin
        data, _status_code, _headers = get_document_drawing_object_ole_data_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_document_drawing_object_ole_data_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads OLE data of a DrawingObject from the document node.
    # @param request GetDocumentDrawingObjectOleDataRequest
    # @return [Array<(File, Fixnum, Hash)>]
    # File, response status code and response headers
    private def get_document_drawing_object_ole_data_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetDocumentDrawingObjectOleDataRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_document_drawing_object_ole_data ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'File')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_document_drawing_object_ole_data\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads OLE data of a DrawingObject from the document node.
    # @param request GetDocumentDrawingObjectOleDataOnlineRequest
    # @return [File]
    def get_document_drawing_object_ole_data_online(request)
        begin
        data, _status_code, _headers = get_document_drawing_object_ole_data_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_document_drawing_object_ole_data_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads OLE data of a DrawingObject from the document node.
    # @param request GetDocumentDrawingObjectOleDataOnlineRequest
    # @return [Array<(File, Fixnum, Hash)>]
    # File, response status code and response headers
    private def get_document_drawing_object_ole_data_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetDocumentDrawingObjectOleDataOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_document_drawing_object_ole_data_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'File')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_document_drawing_object_ole_data_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads DrawingObjects from the document node.
    # @param request GetDocumentDrawingObjectsRequest
    # @return [DrawingObjectsResponse]
    def get_document_drawing_objects(request)
        begin
        data, _status_code, _headers = get_document_drawing_objects_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_document_drawing_objects_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads DrawingObjects from the document node.
    # @param request GetDocumentDrawingObjectsRequest
    # @return [Array<(DrawingObjectsResponse, Fixnum, Hash)>]
    # DrawingObjectsResponse, response status code and response headers
    private def get_document_drawing_objects_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetDocumentDrawingObjectsRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_document_drawing_objects ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'DrawingObjectsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_document_drawing_objects\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads DrawingObjects from the document node.
    # @param request GetDocumentDrawingObjectsOnlineRequest
    # @return [DrawingObjectsResponse]
    def get_document_drawing_objects_online(request)
        begin
        data, _status_code, _headers = get_document_drawing_objects_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_document_drawing_objects_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads DrawingObjects from the document node.
    # @param request GetDocumentDrawingObjectsOnlineRequest
    # @return [Array<(DrawingObjectsResponse, Fixnum, Hash)>]
    # DrawingObjectsResponse, response status code and response headers
    private def get_document_drawing_objects_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetDocumentDrawingObjectsOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_document_drawing_objects_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'DrawingObjectsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_document_drawing_objects_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads merge field names from the document.
    # @param request GetDocumentFieldNamesRequest
    # @return [FieldNamesResponse]
    def get_document_field_names(request)
        begin
        data, _status_code, _headers = get_document_field_names_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_document_field_names_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads merge field names from the document.
    # @param request GetDocumentFieldNamesRequest
    # @return [Array<(FieldNamesResponse, Fixnum, Hash)>]
    # FieldNamesResponse, response status code and response headers
    private def get_document_field_names_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetDocumentFieldNamesRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_document_field_names ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FieldNamesResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_document_field_names\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads merge field names from the document.
    # @param request GetDocumentFieldNamesOnlineRequest
    # @return [FieldNamesResponse]
    def get_document_field_names_online(request)
        begin
        data, _status_code, _headers = get_document_field_names_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_document_field_names_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads merge field names from the document.
    # @param request GetDocumentFieldNamesOnlineRequest
    # @return [Array<(FieldNamesResponse, Fixnum, Hash)>]
    # FieldNamesResponse, response status code and response headers
    private def get_document_field_names_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetDocumentFieldNamesOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_document_field_names_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FieldNamesResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_document_field_names_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a hyperlink from the document.
    # @param request GetDocumentHyperlinkByIndexRequest
    # @return [HyperlinkResponse]
    def get_document_hyperlink_by_index(request)
        begin
        data, _status_code, _headers = get_document_hyperlink_by_index_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_document_hyperlink_by_index_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a hyperlink from the document.
    # @param request GetDocumentHyperlinkByIndexRequest
    # @return [Array<(HyperlinkResponse, Fixnum, Hash)>]
    # HyperlinkResponse, response status code and response headers
    private def get_document_hyperlink_by_index_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetDocumentHyperlinkByIndexRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_document_hyperlink_by_index ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'HyperlinkResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_document_hyperlink_by_index\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a hyperlink from the document.
    # @param request GetDocumentHyperlinkByIndexOnlineRequest
    # @return [HyperlinkResponse]
    def get_document_hyperlink_by_index_online(request)
        begin
        data, _status_code, _headers = get_document_hyperlink_by_index_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_document_hyperlink_by_index_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a hyperlink from the document.
    # @param request GetDocumentHyperlinkByIndexOnlineRequest
    # @return [Array<(HyperlinkResponse, Fixnum, Hash)>]
    # HyperlinkResponse, response status code and response headers
    private def get_document_hyperlink_by_index_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetDocumentHyperlinkByIndexOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_document_hyperlink_by_index_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'HyperlinkResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_document_hyperlink_by_index_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads hyperlinks from the document.
    # @param request GetDocumentHyperlinksRequest
    # @return [HyperlinksResponse]
    def get_document_hyperlinks(request)
        begin
        data, _status_code, _headers = get_document_hyperlinks_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_document_hyperlinks_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads hyperlinks from the document.
    # @param request GetDocumentHyperlinksRequest
    # @return [Array<(HyperlinksResponse, Fixnum, Hash)>]
    # HyperlinksResponse, response status code and response headers
    private def get_document_hyperlinks_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetDocumentHyperlinksRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_document_hyperlinks ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'HyperlinksResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_document_hyperlinks\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads hyperlinks from the document.
    # @param request GetDocumentHyperlinksOnlineRequest
    # @return [HyperlinksResponse]
    def get_document_hyperlinks_online(request)
        begin
        data, _status_code, _headers = get_document_hyperlinks_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_document_hyperlinks_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads hyperlinks from the document.
    # @param request GetDocumentHyperlinksOnlineRequest
    # @return [Array<(HyperlinksResponse, Fixnum, Hash)>]
    # HyperlinksResponse, response status code and response headers
    private def get_document_hyperlinks_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetDocumentHyperlinksOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_document_hyperlinks_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'HyperlinksResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_document_hyperlinks_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads document properties.
    # @param request GetDocumentPropertiesRequest
    # @return [DocumentPropertiesResponse]
    def get_document_properties(request)
        begin
        data, _status_code, _headers = get_document_properties_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_document_properties_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads document properties.
    # @param request GetDocumentPropertiesRequest
    # @return [Array<(DocumentPropertiesResponse, Fixnum, Hash)>]
    # DocumentPropertiesResponse, response status code and response headers
    private def get_document_properties_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetDocumentPropertiesRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_document_properties ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'DocumentPropertiesResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_document_properties\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads document properties.
    # @param request GetDocumentPropertiesOnlineRequest
    # @return [DocumentPropertiesResponse]
    def get_document_properties_online(request)
        begin
        data, _status_code, _headers = get_document_properties_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_document_properties_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads document properties.
    # @param request GetDocumentPropertiesOnlineRequest
    # @return [Array<(DocumentPropertiesResponse, Fixnum, Hash)>]
    # DocumentPropertiesResponse, response status code and response headers
    private def get_document_properties_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetDocumentPropertiesOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_document_properties_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'DocumentPropertiesResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_document_properties_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a document property.
    # @param request GetDocumentPropertyRequest
    # @return [DocumentPropertyResponse]
    def get_document_property(request)
        begin
        data, _status_code, _headers = get_document_property_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_document_property_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a document property.
    # @param request GetDocumentPropertyRequest
    # @return [Array<(DocumentPropertyResponse, Fixnum, Hash)>]
    # DocumentPropertyResponse, response status code and response headers
    private def get_document_property_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetDocumentPropertyRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_document_property ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'DocumentPropertyResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_document_property\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a document property.
    # @param request GetDocumentPropertyOnlineRequest
    # @return [DocumentPropertyResponse]
    def get_document_property_online(request)
        begin
        data, _status_code, _headers = get_document_property_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_document_property_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a document property.
    # @param request GetDocumentPropertyOnlineRequest
    # @return [Array<(DocumentPropertyResponse, Fixnum, Hash)>]
    # DocumentPropertyResponse, response status code and response headers
    private def get_document_property_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetDocumentPropertyOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_document_property_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'DocumentPropertyResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_document_property_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads protection properties from the document.
    # @param request GetDocumentProtectionRequest
    # @return [ProtectionDataResponse]
    def get_document_protection(request)
        begin
        data, _status_code, _headers = get_document_protection_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_document_protection_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads protection properties from the document.
    # @param request GetDocumentProtectionRequest
    # @return [Array<(ProtectionDataResponse, Fixnum, Hash)>]
    # ProtectionDataResponse, response status code and response headers
    private def get_document_protection_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetDocumentProtectionRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_document_protection ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'ProtectionDataResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_document_protection\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads protection properties from the document.
    # @param request GetDocumentProtectionOnlineRequest
    # @return [ProtectionDataResponse]
    def get_document_protection_online(request)
        begin
        data, _status_code, _headers = get_document_protection_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_document_protection_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads protection properties from the document.
    # @param request GetDocumentProtectionOnlineRequest
    # @return [Array<(ProtectionDataResponse, Fixnum, Hash)>]
    # ProtectionDataResponse, response status code and response headers
    private def get_document_protection_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetDocumentProtectionOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_document_protection_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'ProtectionDataResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_document_protection_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads document statistics.
    # @param request GetDocumentStatisticsRequest
    # @return [StatDataResponse]
    def get_document_statistics(request)
        begin
        data, _status_code, _headers = get_document_statistics_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_document_statistics_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads document statistics.
    # @param request GetDocumentStatisticsRequest
    # @return [Array<(StatDataResponse, Fixnum, Hash)>]
    # StatDataResponse, response status code and response headers
    private def get_document_statistics_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetDocumentStatisticsRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_document_statistics ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'StatDataResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_document_statistics\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads document statistics.
    # @param request GetDocumentStatisticsOnlineRequest
    # @return [StatDataResponse]
    def get_document_statistics_online(request)
        begin
        data, _status_code, _headers = get_document_statistics_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_document_statistics_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads document statistics.
    # @param request GetDocumentStatisticsOnlineRequest
    # @return [Array<(StatDataResponse, Fixnum, Hash)>]
    # StatDataResponse, response status code and response headers
    private def get_document_statistics_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetDocumentStatisticsOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_document_statistics_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'StatDataResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_document_statistics_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Converts a document in cloud storage to the specified format.
    # @param request GetDocumentWithFormatRequest
    # @return [File]
    def get_document_with_format(request)
        begin
        data, _status_code, _headers = get_document_with_format_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_document_with_format_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Converts a document in cloud storage to the specified format.
    # @param request GetDocumentWithFormatRequest
    # @return [Array<(File, Fixnum, Hash)>]
    # File, response status code and response headers
    private def get_document_with_format_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetDocumentWithFormatRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_document_with_format ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'File')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_document_with_format\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a field from the document node.
    # @param request GetFieldRequest
    # @return [FieldResponse]
    def get_field(request)
        begin
        data, _status_code, _headers = get_field_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_field_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a field from the document node.
    # @param request GetFieldRequest
    # @return [Array<(FieldResponse, Fixnum, Hash)>]
    # FieldResponse, response status code and response headers
    private def get_field_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetFieldRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_field ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FieldResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_field\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a field from the document node.
    # @param request GetFieldOnlineRequest
    # @return [FieldResponse]
    def get_field_online(request)
        begin
        data, _status_code, _headers = get_field_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_field_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a field from the document node.
    # @param request GetFieldOnlineRequest
    # @return [Array<(FieldResponse, Fixnum, Hash)>]
    # FieldResponse, response status code and response headers
    private def get_field_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetFieldOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_field_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FieldResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_field_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads fields from the document node.
    # @param request GetFieldsRequest
    # @return [FieldsResponse]
    def get_fields(request)
        begin
        data, _status_code, _headers = get_fields_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_fields_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads fields from the document node.
    # @param request GetFieldsRequest
    # @return [Array<(FieldsResponse, Fixnum, Hash)>]
    # FieldsResponse, response status code and response headers
    private def get_fields_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetFieldsRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_fields ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FieldsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_fields\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads fields from the document node.
    # @param request GetFieldsOnlineRequest
    # @return [FieldsResponse]
    def get_fields_online(request)
        begin
        data, _status_code, _headers = get_fields_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_fields_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads fields from the document node.
    # @param request GetFieldsOnlineRequest
    # @return [Array<(FieldsResponse, Fixnum, Hash)>]
    # FieldsResponse, response status code and response headers
    private def get_fields_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetFieldsOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_fields_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FieldsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_fields_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Get all files and folders within a folder.
    # @param request GetFilesListRequest
    # @return [FilesList]
    def get_files_list(request)
        begin
        data, _status_code, _headers = get_files_list_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_files_list_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Get all files and folders within a folder.
    # @param request GetFilesListRequest
    # @return [Array<(FilesList, Fixnum, Hash)>]
    # FilesList, response status code and response headers
    private def get_files_list_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetFilesListRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_files_list ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FilesList')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_files_list\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a footnote from the document node.
    # @param request GetFootnoteRequest
    # @return [FootnoteResponse]
    def get_footnote(request)
        begin
        data, _status_code, _headers = get_footnote_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_footnote_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a footnote from the document node.
    # @param request GetFootnoteRequest
    # @return [Array<(FootnoteResponse, Fixnum, Hash)>]
    # FootnoteResponse, response status code and response headers
    private def get_footnote_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetFootnoteRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_footnote ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FootnoteResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_footnote\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a footnote from the document node.
    # @param request GetFootnoteOnlineRequest
    # @return [FootnoteResponse]
    def get_footnote_online(request)
        begin
        data, _status_code, _headers = get_footnote_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_footnote_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a footnote from the document node.
    # @param request GetFootnoteOnlineRequest
    # @return [Array<(FootnoteResponse, Fixnum, Hash)>]
    # FootnoteResponse, response status code and response headers
    private def get_footnote_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetFootnoteOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_footnote_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FootnoteResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_footnote_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads footnotes from the document node.
    # @param request GetFootnotesRequest
    # @return [FootnotesResponse]
    def get_footnotes(request)
        begin
        data, _status_code, _headers = get_footnotes_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_footnotes_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads footnotes from the document node.
    # @param request GetFootnotesRequest
    # @return [Array<(FootnotesResponse, Fixnum, Hash)>]
    # FootnotesResponse, response status code and response headers
    private def get_footnotes_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetFootnotesRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_footnotes ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FootnotesResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_footnotes\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads footnotes from the document node.
    # @param request GetFootnotesOnlineRequest
    # @return [FootnotesResponse]
    def get_footnotes_online(request)
        begin
        data, _status_code, _headers = get_footnotes_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_footnotes_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads footnotes from the document node.
    # @param request GetFootnotesOnlineRequest
    # @return [Array<(FootnotesResponse, Fixnum, Hash)>]
    # FootnotesResponse, response status code and response headers
    private def get_footnotes_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetFootnotesOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_footnotes_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FootnotesResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_footnotes_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a form field from the document node.
    # @param request GetFormFieldRequest
    # @return [FormFieldResponse]
    def get_form_field(request)
        begin
        data, _status_code, _headers = get_form_field_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_form_field_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a form field from the document node.
    # @param request GetFormFieldRequest
    # @return [Array<(FormFieldResponse, Fixnum, Hash)>]
    # FormFieldResponse, response status code and response headers
    private def get_form_field_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetFormFieldRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_form_field ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FormFieldResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_form_field\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a form field from the document node.
    # @param request GetFormFieldOnlineRequest
    # @return [FormFieldResponse]
    def get_form_field_online(request)
        begin
        data, _status_code, _headers = get_form_field_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_form_field_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a form field from the document node.
    # @param request GetFormFieldOnlineRequest
    # @return [Array<(FormFieldResponse, Fixnum, Hash)>]
    # FormFieldResponse, response status code and response headers
    private def get_form_field_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetFormFieldOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_form_field_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FormFieldResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_form_field_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads form fields from the document node.
    # @param request GetFormFieldsRequest
    # @return [FormFieldsResponse]
    def get_form_fields(request)
        begin
        data, _status_code, _headers = get_form_fields_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_form_fields_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads form fields from the document node.
    # @param request GetFormFieldsRequest
    # @return [Array<(FormFieldsResponse, Fixnum, Hash)>]
    # FormFieldsResponse, response status code and response headers
    private def get_form_fields_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetFormFieldsRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_form_fields ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FormFieldsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_form_fields\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads form fields from the document node.
    # @param request GetFormFieldsOnlineRequest
    # @return [FormFieldsResponse]
    def get_form_fields_online(request)
        begin
        data, _status_code, _headers = get_form_fields_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_form_fields_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads form fields from the document node.
    # @param request GetFormFieldsOnlineRequest
    # @return [Array<(FormFieldsResponse, Fixnum, Hash)>]
    # FormFieldsResponse, response status code and response headers
    private def get_form_fields_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetFormFieldsOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_form_fields_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FormFieldsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_form_fields_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a HeaderFooter object from the document.
    # @param request GetHeaderFooterRequest
    # @return [HeaderFooterResponse]
    def get_header_footer(request)
        begin
        data, _status_code, _headers = get_header_footer_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_header_footer_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a HeaderFooter object from the document.
    # @param request GetHeaderFooterRequest
    # @return [Array<(HeaderFooterResponse, Fixnum, Hash)>]
    # HeaderFooterResponse, response status code and response headers
    private def get_header_footer_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetHeaderFooterRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_header_footer ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'HeaderFooterResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_header_footer\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a HeaderFooter object from the document section.
    # @param request GetHeaderFooterOfSectionRequest
    # @return [HeaderFooterResponse]
    def get_header_footer_of_section(request)
        begin
        data, _status_code, _headers = get_header_footer_of_section_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_header_footer_of_section_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a HeaderFooter object from the document section.
    # @param request GetHeaderFooterOfSectionRequest
    # @return [Array<(HeaderFooterResponse, Fixnum, Hash)>]
    # HeaderFooterResponse, response status code and response headers
    private def get_header_footer_of_section_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetHeaderFooterOfSectionRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_header_footer_of_section ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'HeaderFooterResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_header_footer_of_section\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a HeaderFooter object from the document section.
    # @param request GetHeaderFooterOfSectionOnlineRequest
    # @return [HeaderFooterResponse]
    def get_header_footer_of_section_online(request)
        begin
        data, _status_code, _headers = get_header_footer_of_section_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_header_footer_of_section_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a HeaderFooter object from the document section.
    # @param request GetHeaderFooterOfSectionOnlineRequest
    # @return [Array<(HeaderFooterResponse, Fixnum, Hash)>]
    # HeaderFooterResponse, response status code and response headers
    private def get_header_footer_of_section_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetHeaderFooterOfSectionOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_header_footer_of_section_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'HeaderFooterResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_header_footer_of_section_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a HeaderFooter object from the document.
    # @param request GetHeaderFooterOnlineRequest
    # @return [HeaderFooterResponse]
    def get_header_footer_online(request)
        begin
        data, _status_code, _headers = get_header_footer_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_header_footer_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a HeaderFooter object from the document.
    # @param request GetHeaderFooterOnlineRequest
    # @return [Array<(HeaderFooterResponse, Fixnum, Hash)>]
    # HeaderFooterResponse, response status code and response headers
    private def get_header_footer_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetHeaderFooterOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_header_footer_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'HeaderFooterResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_header_footer_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads HeaderFooter objects from the document section.
    # @param request GetHeaderFootersRequest
    # @return [HeaderFootersResponse]
    def get_header_footers(request)
        begin
        data, _status_code, _headers = get_header_footers_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_header_footers_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads HeaderFooter objects from the document section.
    # @param request GetHeaderFootersRequest
    # @return [Array<(HeaderFootersResponse, Fixnum, Hash)>]
    # HeaderFootersResponse, response status code and response headers
    private def get_header_footers_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetHeaderFootersRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_header_footers ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'HeaderFootersResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_header_footers\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads HeaderFooter objects from the document section.
    # @param request GetHeaderFootersOnlineRequest
    # @return [HeaderFootersResponse]
    def get_header_footers_online(request)
        begin
        data, _status_code, _headers = get_header_footers_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_header_footers_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads HeaderFooter objects from the document section.
    # @param request GetHeaderFootersOnlineRequest
    # @return [Array<(HeaderFootersResponse, Fixnum, Hash)>]
    # HeaderFootersResponse, response status code and response headers
    private def get_header_footers_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetHeaderFootersOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_header_footers_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'HeaderFootersResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_header_footers_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Returns application info.
    # @param request GetInfoRequest
    # @return [InfoResponse]
    def get_info(request)
        begin
        data, _status_code, _headers = get_info_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_info_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Returns application info.
    # @param request GetInfoRequest
    # @return [Array<(InfoResponse, Fixnum, Hash)>]
    # InfoResponse, response status code and response headers
    private def get_info_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetInfoRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_info ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'InfoResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_info\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a list from the document.
    # @param request GetListRequest
    # @return [ListResponse]
    def get_list(request)
        begin
        data, _status_code, _headers = get_list_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_list_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a list from the document.
    # @param request GetListRequest
    # @return [Array<(ListResponse, Fixnum, Hash)>]
    # ListResponse, response status code and response headers
    private def get_list_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetListRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_list ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'ListResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_list\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a list from the document.
    # @param request GetListOnlineRequest
    # @return [ListResponse]
    def get_list_online(request)
        begin
        data, _status_code, _headers = get_list_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_list_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a list from the document.
    # @param request GetListOnlineRequest
    # @return [Array<(ListResponse, Fixnum, Hash)>]
    # ListResponse, response status code and response headers
    private def get_list_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetListOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_list_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'ListResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_list_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads lists from the document.
    # @param request GetListsRequest
    # @return [ListsResponse]
    def get_lists(request)
        begin
        data, _status_code, _headers = get_lists_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_lists_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads lists from the document.
    # @param request GetListsRequest
    # @return [Array<(ListsResponse, Fixnum, Hash)>]
    # ListsResponse, response status code and response headers
    private def get_lists_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetListsRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_lists ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'ListsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_lists\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads lists from the document.
    # @param request GetListsOnlineRequest
    # @return [ListsResponse]
    def get_lists_online(request)
        begin
        data, _status_code, _headers = get_lists_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_lists_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads lists from the document.
    # @param request GetListsOnlineRequest
    # @return [Array<(ListsResponse, Fixnum, Hash)>]
    # ListsResponse, response status code and response headers
    private def get_lists_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetListsOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_lists_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'ListsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_lists_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads an OfficeMath object from the document node.
    # @param request GetOfficeMathObjectRequest
    # @return [OfficeMathObjectResponse]
    def get_office_math_object(request)
        begin
        data, _status_code, _headers = get_office_math_object_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_office_math_object_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads an OfficeMath object from the document node.
    # @param request GetOfficeMathObjectRequest
    # @return [Array<(OfficeMathObjectResponse, Fixnum, Hash)>]
    # OfficeMathObjectResponse, response status code and response headers
    private def get_office_math_object_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetOfficeMathObjectRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_office_math_object ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'OfficeMathObjectResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_office_math_object\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads an OfficeMath object from the document node.
    # @param request GetOfficeMathObjectOnlineRequest
    # @return [OfficeMathObjectResponse]
    def get_office_math_object_online(request)
        begin
        data, _status_code, _headers = get_office_math_object_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_office_math_object_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads an OfficeMath object from the document node.
    # @param request GetOfficeMathObjectOnlineRequest
    # @return [Array<(OfficeMathObjectResponse, Fixnum, Hash)>]
    # OfficeMathObjectResponse, response status code and response headers
    private def get_office_math_object_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetOfficeMathObjectOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_office_math_object_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'OfficeMathObjectResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_office_math_object_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads OfficeMath objects from the document node.
    # @param request GetOfficeMathObjectsRequest
    # @return [OfficeMathObjectsResponse]
    def get_office_math_objects(request)
        begin
        data, _status_code, _headers = get_office_math_objects_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_office_math_objects_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads OfficeMath objects from the document node.
    # @param request GetOfficeMathObjectsRequest
    # @return [Array<(OfficeMathObjectsResponse, Fixnum, Hash)>]
    # OfficeMathObjectsResponse, response status code and response headers
    private def get_office_math_objects_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetOfficeMathObjectsRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_office_math_objects ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'OfficeMathObjectsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_office_math_objects\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads OfficeMath objects from the document node.
    # @param request GetOfficeMathObjectsOnlineRequest
    # @return [OfficeMathObjectsResponse]
    def get_office_math_objects_online(request)
        begin
        data, _status_code, _headers = get_office_math_objects_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_office_math_objects_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads OfficeMath objects from the document node.
    # @param request GetOfficeMathObjectsOnlineRequest
    # @return [Array<(OfficeMathObjectsResponse, Fixnum, Hash)>]
    # OfficeMathObjectsResponse, response status code and response headers
    private def get_office_math_objects_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetOfficeMathObjectsOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_office_math_objects_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'OfficeMathObjectsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_office_math_objects_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a paragraph from the document node.
    # @param request GetParagraphRequest
    # @return [ParagraphResponse]
    def get_paragraph(request)
        begin
        data, _status_code, _headers = get_paragraph_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_paragraph_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a paragraph from the document node.
    # @param request GetParagraphRequest
    # @return [Array<(ParagraphResponse, Fixnum, Hash)>]
    # ParagraphResponse, response status code and response headers
    private def get_paragraph_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetParagraphRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_paragraph ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'ParagraphResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_paragraph\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads the formatting properties of a paragraph from the document node.
    # @param request GetParagraphFormatRequest
    # @return [ParagraphFormatResponse]
    def get_paragraph_format(request)
        begin
        data, _status_code, _headers = get_paragraph_format_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_paragraph_format_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads the formatting properties of a paragraph from the document node.
    # @param request GetParagraphFormatRequest
    # @return [Array<(ParagraphFormatResponse, Fixnum, Hash)>]
    # ParagraphFormatResponse, response status code and response headers
    private def get_paragraph_format_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetParagraphFormatRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_paragraph_format ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'ParagraphFormatResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_paragraph_format\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads the formatting properties of a paragraph from the document node.
    # @param request GetParagraphFormatOnlineRequest
    # @return [ParagraphFormatResponse]
    def get_paragraph_format_online(request)
        begin
        data, _status_code, _headers = get_paragraph_format_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_paragraph_format_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads the formatting properties of a paragraph from the document node.
    # @param request GetParagraphFormatOnlineRequest
    # @return [Array<(ParagraphFormatResponse, Fixnum, Hash)>]
    # ParagraphFormatResponse, response status code and response headers
    private def get_paragraph_format_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetParagraphFormatOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_paragraph_format_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'ParagraphFormatResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_paragraph_format_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads the formatting properties of a paragraph list from the document node.
    # @param request GetParagraphListFormatRequest
    # @return [ParagraphListFormatResponse]
    def get_paragraph_list_format(request)
        begin
        data, _status_code, _headers = get_paragraph_list_format_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_paragraph_list_format_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads the formatting properties of a paragraph list from the document node.
    # @param request GetParagraphListFormatRequest
    # @return [Array<(ParagraphListFormatResponse, Fixnum, Hash)>]
    # ParagraphListFormatResponse, response status code and response headers
    private def get_paragraph_list_format_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetParagraphListFormatRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_paragraph_list_format ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'ParagraphListFormatResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_paragraph_list_format\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads the formatting properties of a paragraph list from the document node.
    # @param request GetParagraphListFormatOnlineRequest
    # @return [ParagraphListFormatResponse]
    def get_paragraph_list_format_online(request)
        begin
        data, _status_code, _headers = get_paragraph_list_format_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_paragraph_list_format_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads the formatting properties of a paragraph list from the document node.
    # @param request GetParagraphListFormatOnlineRequest
    # @return [Array<(ParagraphListFormatResponse, Fixnum, Hash)>]
    # ParagraphListFormatResponse, response status code and response headers
    private def get_paragraph_list_format_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetParagraphListFormatOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_paragraph_list_format_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'ParagraphListFormatResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_paragraph_list_format_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a paragraph from the document node.
    # @param request GetParagraphOnlineRequest
    # @return [ParagraphResponse]
    def get_paragraph_online(request)
        begin
        data, _status_code, _headers = get_paragraph_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_paragraph_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a paragraph from the document node.
    # @param request GetParagraphOnlineRequest
    # @return [Array<(ParagraphResponse, Fixnum, Hash)>]
    # ParagraphResponse, response status code and response headers
    private def get_paragraph_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetParagraphOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_paragraph_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'ParagraphResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_paragraph_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads paragraphs from the document node.
    # @param request GetParagraphsRequest
    # @return [ParagraphLinkCollectionResponse]
    def get_paragraphs(request)
        begin
        data, _status_code, _headers = get_paragraphs_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_paragraphs_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads paragraphs from the document node.
    # @param request GetParagraphsRequest
    # @return [Array<(ParagraphLinkCollectionResponse, Fixnum, Hash)>]
    # ParagraphLinkCollectionResponse, response status code and response headers
    private def get_paragraphs_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetParagraphsRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_paragraphs ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'ParagraphLinkCollectionResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_paragraphs\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads paragraphs from the document node.
    # @param request GetParagraphsOnlineRequest
    # @return [ParagraphLinkCollectionResponse]
    def get_paragraphs_online(request)
        begin
        data, _status_code, _headers = get_paragraphs_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_paragraphs_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads paragraphs from the document node.
    # @param request GetParagraphsOnlineRequest
    # @return [Array<(ParagraphLinkCollectionResponse, Fixnum, Hash)>]
    # ParagraphLinkCollectionResponse, response status code and response headers
    private def get_paragraphs_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetParagraphsOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_paragraphs_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'ParagraphLinkCollectionResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_paragraphs_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads paragraph tab stops from the document node.
    # @param request GetParagraphTabStopsRequest
    # @return [TabStopsResponse]
    def get_paragraph_tab_stops(request)
        begin
        data, _status_code, _headers = get_paragraph_tab_stops_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_paragraph_tab_stops_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads paragraph tab stops from the document node.
    # @param request GetParagraphTabStopsRequest
    # @return [Array<(TabStopsResponse, Fixnum, Hash)>]
    # TabStopsResponse, response status code and response headers
    private def get_paragraph_tab_stops_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetParagraphTabStopsRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_paragraph_tab_stops ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'TabStopsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_paragraph_tab_stops\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads paragraph tab stops from the document node.
    # @param request GetParagraphTabStopsOnlineRequest
    # @return [TabStopsResponse]
    def get_paragraph_tab_stops_online(request)
        begin
        data, _status_code, _headers = get_paragraph_tab_stops_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_paragraph_tab_stops_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads paragraph tab stops from the document node.
    # @param request GetParagraphTabStopsOnlineRequest
    # @return [Array<(TabStopsResponse, Fixnum, Hash)>]
    # TabStopsResponse, response status code and response headers
    private def get_paragraph_tab_stops_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetParagraphTabStopsOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_paragraph_tab_stops_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'TabStopsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_paragraph_tab_stops_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Get asymmetric public key.
    # @param request GetPublicKeyRequest
    # @return [PublicKeyResponse]
    def get_public_key(request)
        begin
        data, _status_code, _headers = get_public_key_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_public_key_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Get asymmetric public key.
    # @param request GetPublicKeyRequest
    # @return [Array<(PublicKeyResponse, Fixnum, Hash)>]
    # PublicKeyResponse, response status code and response headers
    private def get_public_key_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetPublicKeyRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_public_key ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'PublicKeyResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_public_key\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads range text from the document.
    # @param request GetRangeTextRequest
    # @return [RangeTextResponse]
    def get_range_text(request)
        begin
        data, _status_code, _headers = get_range_text_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_range_text_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads range text from the document.
    # @param request GetRangeTextRequest
    # @return [Array<(RangeTextResponse, Fixnum, Hash)>]
    # RangeTextResponse, response status code and response headers
    private def get_range_text_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetRangeTextRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_range_text ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'RangeTextResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_range_text\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads range text from the document.
    # @param request GetRangeTextOnlineRequest
    # @return [RangeTextResponse]
    def get_range_text_online(request)
        begin
        data, _status_code, _headers = get_range_text_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_range_text_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads range text from the document.
    # @param request GetRangeTextOnlineRequest
    # @return [Array<(RangeTextResponse, Fixnum, Hash)>]
    # RangeTextResponse, response status code and response headers
    private def get_range_text_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetRangeTextOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_range_text_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'RangeTextResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_range_text_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a Run object from the paragraph.
    # @param request GetRunRequest
    # @return [RunResponse]
    def get_run(request)
        begin
        data, _status_code, _headers = get_run_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_run_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a Run object from the paragraph.
    # @param request GetRunRequest
    # @return [Array<(RunResponse, Fixnum, Hash)>]
    # RunResponse, response status code and response headers
    private def get_run_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetRunRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_run ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'RunResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_run\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads the font properties of a Run object from the paragraph.
    # @param request GetRunFontRequest
    # @return [FontResponse]
    def get_run_font(request)
        begin
        data, _status_code, _headers = get_run_font_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_run_font_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads the font properties of a Run object from the paragraph.
    # @param request GetRunFontRequest
    # @return [Array<(FontResponse, Fixnum, Hash)>]
    # FontResponse, response status code and response headers
    private def get_run_font_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetRunFontRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_run_font ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FontResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_run_font\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads the font properties of a Run object from the paragraph.
    # @param request GetRunFontOnlineRequest
    # @return [FontResponse]
    def get_run_font_online(request)
        begin
        data, _status_code, _headers = get_run_font_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_run_font_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads the font properties of a Run object from the paragraph.
    # @param request GetRunFontOnlineRequest
    # @return [Array<(FontResponse, Fixnum, Hash)>]
    # FontResponse, response status code and response headers
    private def get_run_font_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetRunFontOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_run_font_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FontResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_run_font_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a Run object from the paragraph.
    # @param request GetRunOnlineRequest
    # @return [RunResponse]
    def get_run_online(request)
        begin
        data, _status_code, _headers = get_run_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_run_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a Run object from the paragraph.
    # @param request GetRunOnlineRequest
    # @return [Array<(RunResponse, Fixnum, Hash)>]
    # RunResponse, response status code and response headers
    private def get_run_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetRunOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_run_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'RunResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_run_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads Run objects from the paragraph.
    # @param request GetRunsRequest
    # @return [RunsResponse]
    def get_runs(request)
        begin
        data, _status_code, _headers = get_runs_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_runs_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads Run objects from the paragraph.
    # @param request GetRunsRequest
    # @return [Array<(RunsResponse, Fixnum, Hash)>]
    # RunsResponse, response status code and response headers
    private def get_runs_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetRunsRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_runs ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'RunsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_runs\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads Run objects from the paragraph.
    # @param request GetRunsOnlineRequest
    # @return [RunsResponse]
    def get_runs_online(request)
        begin
        data, _status_code, _headers = get_runs_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_runs_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads Run objects from the paragraph.
    # @param request GetRunsOnlineRequest
    # @return [Array<(RunsResponse, Fixnum, Hash)>]
    # RunsResponse, response status code and response headers
    private def get_runs_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetRunsOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_runs_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'RunsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_runs_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a section from the document.
    # @param request GetSectionRequest
    # @return [SectionResponse]
    def get_section(request)
        begin
        data, _status_code, _headers = get_section_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_section_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a section from the document.
    # @param request GetSectionRequest
    # @return [Array<(SectionResponse, Fixnum, Hash)>]
    # SectionResponse, response status code and response headers
    private def get_section_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetSectionRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_section ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'SectionResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_section\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a section from the document.
    # @param request GetSectionOnlineRequest
    # @return [SectionResponse]
    def get_section_online(request)
        begin
        data, _status_code, _headers = get_section_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_section_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a section from the document.
    # @param request GetSectionOnlineRequest
    # @return [Array<(SectionResponse, Fixnum, Hash)>]
    # SectionResponse, response status code and response headers
    private def get_section_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetSectionOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_section_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'SectionResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_section_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads the page setup of a section from the document.
    # @param request GetSectionPageSetupRequest
    # @return [SectionPageSetupResponse]
    def get_section_page_setup(request)
        begin
        data, _status_code, _headers = get_section_page_setup_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_section_page_setup_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads the page setup of a section from the document.
    # @param request GetSectionPageSetupRequest
    # @return [Array<(SectionPageSetupResponse, Fixnum, Hash)>]
    # SectionPageSetupResponse, response status code and response headers
    private def get_section_page_setup_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetSectionPageSetupRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_section_page_setup ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'SectionPageSetupResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_section_page_setup\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads the page setup of a section from the document.
    # @param request GetSectionPageSetupOnlineRequest
    # @return [SectionPageSetupResponse]
    def get_section_page_setup_online(request)
        begin
        data, _status_code, _headers = get_section_page_setup_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_section_page_setup_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads the page setup of a section from the document.
    # @param request GetSectionPageSetupOnlineRequest
    # @return [Array<(SectionPageSetupResponse, Fixnum, Hash)>]
    # SectionPageSetupResponse, response status code and response headers
    private def get_section_page_setup_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetSectionPageSetupOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_section_page_setup_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'SectionPageSetupResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_section_page_setup_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads sections from the document.
    # @param request GetSectionsRequest
    # @return [SectionLinkCollectionResponse]
    def get_sections(request)
        begin
        data, _status_code, _headers = get_sections_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_sections_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads sections from the document.
    # @param request GetSectionsRequest
    # @return [Array<(SectionLinkCollectionResponse, Fixnum, Hash)>]
    # SectionLinkCollectionResponse, response status code and response headers
    private def get_sections_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetSectionsRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_sections ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'SectionLinkCollectionResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_sections\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads sections from the document.
    # @param request GetSectionsOnlineRequest
    # @return [SectionLinkCollectionResponse]
    def get_sections_online(request)
        begin
        data, _status_code, _headers = get_sections_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_sections_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads sections from the document.
    # @param request GetSectionsOnlineRequest
    # @return [Array<(SectionLinkCollectionResponse, Fixnum, Hash)>]
    # SectionLinkCollectionResponse, response status code and response headers
    private def get_sections_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetSectionsOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_sections_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'SectionLinkCollectionResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_sections_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Gets signatures from the document.
    # @param request GetSignaturesRequest
    # @return [SignatureCollectionResponse]
    def get_signatures(request)
        begin
        data, _status_code, _headers = get_signatures_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_signatures_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Gets signatures from the document.
    # @param request GetSignaturesRequest
    # @return [Array<(SignatureCollectionResponse, Fixnum, Hash)>]
    # SignatureCollectionResponse, response status code and response headers
    private def get_signatures_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetSignaturesRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_signatures ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'SignatureCollectionResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_signatures\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Gets signatures from the document.
    # @param request GetSignaturesOnlineRequest
    # @return [SignatureCollectionResponse]
    def get_signatures_online(request)
        begin
        data, _status_code, _headers = get_signatures_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_signatures_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Gets signatures from the document.
    # @param request GetSignaturesOnlineRequest
    # @return [Array<(SignatureCollectionResponse, Fixnum, Hash)>]
    # SignatureCollectionResponse, response status code and response headers
    private def get_signatures_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetSignaturesOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_signatures_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'SignatureCollectionResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_signatures_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a StructuredDocumentTag (SDT) from the document node.
    # @param request GetStructuredDocumentTagRequest
    # @return [StructuredDocumentTagResponse]
    def get_structured_document_tag(request)
        begin
        data, _status_code, _headers = get_structured_document_tag_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_structured_document_tag_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a StructuredDocumentTag (SDT) from the document node.
    # @param request GetStructuredDocumentTagRequest
    # @return [Array<(StructuredDocumentTagResponse, Fixnum, Hash)>]
    # StructuredDocumentTagResponse, response status code and response headers
    private def get_structured_document_tag_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetStructuredDocumentTagRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_structured_document_tag ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'StructuredDocumentTagResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_structured_document_tag\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a StructuredDocumentTag (SDT) from the document node.
    # @param request GetStructuredDocumentTagOnlineRequest
    # @return [StructuredDocumentTagResponse]
    def get_structured_document_tag_online(request)
        begin
        data, _status_code, _headers = get_structured_document_tag_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_structured_document_tag_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a StructuredDocumentTag (SDT) from the document node.
    # @param request GetStructuredDocumentTagOnlineRequest
    # @return [Array<(StructuredDocumentTagResponse, Fixnum, Hash)>]
    # StructuredDocumentTagResponse, response status code and response headers
    private def get_structured_document_tag_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetStructuredDocumentTagOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_structured_document_tag_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'StructuredDocumentTagResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_structured_document_tag_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads StructuredDocumentTags (SDT) from the document node.
    # @param request GetStructuredDocumentTagsRequest
    # @return [StructuredDocumentTagsResponse]
    def get_structured_document_tags(request)
        begin
        data, _status_code, _headers = get_structured_document_tags_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_structured_document_tags_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads StructuredDocumentTags (SDT) from the document node.
    # @param request GetStructuredDocumentTagsRequest
    # @return [Array<(StructuredDocumentTagsResponse, Fixnum, Hash)>]
    # StructuredDocumentTagsResponse, response status code and response headers
    private def get_structured_document_tags_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetStructuredDocumentTagsRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_structured_document_tags ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'StructuredDocumentTagsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_structured_document_tags\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads StructuredDocumentTags (SDT) from the document node.
    # @param request GetStructuredDocumentTagsOnlineRequest
    # @return [StructuredDocumentTagsResponse]
    def get_structured_document_tags_online(request)
        begin
        data, _status_code, _headers = get_structured_document_tags_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_structured_document_tags_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads StructuredDocumentTags (SDT) from the document node.
    # @param request GetStructuredDocumentTagsOnlineRequest
    # @return [Array<(StructuredDocumentTagsResponse, Fixnum, Hash)>]
    # StructuredDocumentTagsResponse, response status code and response headers
    private def get_structured_document_tags_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetStructuredDocumentTagsOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_structured_document_tags_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'StructuredDocumentTagsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_structured_document_tags_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a style from the document.
    # @param request GetStyleRequest
    # @return [StyleResponse]
    def get_style(request)
        begin
        data, _status_code, _headers = get_style_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_style_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a style from the document.
    # @param request GetStyleRequest
    # @return [Array<(StyleResponse, Fixnum, Hash)>]
    # StyleResponse, response status code and response headers
    private def get_style_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetStyleRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_style ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'StyleResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_style\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a style from the document node.
    # @param request GetStyleFromDocumentElementRequest
    # @return [StyleResponse]
    def get_style_from_document_element(request)
        begin
        data, _status_code, _headers = get_style_from_document_element_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_style_from_document_element_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a style from the document node.
    # @param request GetStyleFromDocumentElementRequest
    # @return [Array<(StyleResponse, Fixnum, Hash)>]
    # StyleResponse, response status code and response headers
    private def get_style_from_document_element_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetStyleFromDocumentElementRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_style_from_document_element ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'StyleResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_style_from_document_element\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a style from the document node.
    # @param request GetStyleFromDocumentElementOnlineRequest
    # @return [StyleResponse]
    def get_style_from_document_element_online(request)
        begin
        data, _status_code, _headers = get_style_from_document_element_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_style_from_document_element_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a style from the document node.
    # @param request GetStyleFromDocumentElementOnlineRequest
    # @return [Array<(StyleResponse, Fixnum, Hash)>]
    # StyleResponse, response status code and response headers
    private def get_style_from_document_element_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetStyleFromDocumentElementOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_style_from_document_element_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'StyleResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_style_from_document_element_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a style from the document.
    # @param request GetStyleOnlineRequest
    # @return [StyleResponse]
    def get_style_online(request)
        begin
        data, _status_code, _headers = get_style_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_style_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a style from the document.
    # @param request GetStyleOnlineRequest
    # @return [Array<(StyleResponse, Fixnum, Hash)>]
    # StyleResponse, response status code and response headers
    private def get_style_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetStyleOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_style_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'StyleResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_style_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads styles from the document.
    # @param request GetStylesRequest
    # @return [StylesResponse]
    def get_styles(request)
        begin
        data, _status_code, _headers = get_styles_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_styles_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads styles from the document.
    # @param request GetStylesRequest
    # @return [Array<(StylesResponse, Fixnum, Hash)>]
    # StylesResponse, response status code and response headers
    private def get_styles_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetStylesRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_styles ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'StylesResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_styles\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads styles from the document.
    # @param request GetStylesOnlineRequest
    # @return [StylesResponse]
    def get_styles_online(request)
        begin
        data, _status_code, _headers = get_styles_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_styles_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads styles from the document.
    # @param request GetStylesOnlineRequest
    # @return [Array<(StylesResponse, Fixnum, Hash)>]
    # StylesResponse, response status code and response headers
    private def get_styles_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetStylesOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_styles_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'StylesResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_styles_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a table from the document node.
    # @param request GetTableRequest
    # @return [TableResponse]
    def get_table(request)
        begin
        data, _status_code, _headers = get_table_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_table_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a table from the document node.
    # @param request GetTableRequest
    # @return [Array<(TableResponse, Fixnum, Hash)>]
    # TableResponse, response status code and response headers
    private def get_table_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetTableRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_table ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'TableResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_table\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a cell from the table row.
    # @param request GetTableCellRequest
    # @return [TableCellResponse]
    def get_table_cell(request)
        begin
        data, _status_code, _headers = get_table_cell_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_table_cell_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a cell from the table row.
    # @param request GetTableCellRequest
    # @return [Array<(TableCellResponse, Fixnum, Hash)>]
    # TableCellResponse, response status code and response headers
    private def get_table_cell_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetTableCellRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_table_cell ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'TableCellResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_table_cell\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads the formatting properties of a table cell.
    # @param request GetTableCellFormatRequest
    # @return [TableCellFormatResponse]
    def get_table_cell_format(request)
        begin
        data, _status_code, _headers = get_table_cell_format_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_table_cell_format_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads the formatting properties of a table cell.
    # @param request GetTableCellFormatRequest
    # @return [Array<(TableCellFormatResponse, Fixnum, Hash)>]
    # TableCellFormatResponse, response status code and response headers
    private def get_table_cell_format_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetTableCellFormatRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_table_cell_format ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'TableCellFormatResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_table_cell_format\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads the formatting properties of a table cell.
    # @param request GetTableCellFormatOnlineRequest
    # @return [TableCellFormatResponse]
    def get_table_cell_format_online(request)
        begin
        data, _status_code, _headers = get_table_cell_format_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_table_cell_format_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads the formatting properties of a table cell.
    # @param request GetTableCellFormatOnlineRequest
    # @return [Array<(TableCellFormatResponse, Fixnum, Hash)>]
    # TableCellFormatResponse, response status code and response headers
    private def get_table_cell_format_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetTableCellFormatOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_table_cell_format_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'TableCellFormatResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_table_cell_format_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a cell from the table row.
    # @param request GetTableCellOnlineRequest
    # @return [TableCellResponse]
    def get_table_cell_online(request)
        begin
        data, _status_code, _headers = get_table_cell_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_table_cell_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a cell from the table row.
    # @param request GetTableCellOnlineRequest
    # @return [Array<(TableCellResponse, Fixnum, Hash)>]
    # TableCellResponse, response status code and response headers
    private def get_table_cell_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetTableCellOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_table_cell_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'TableCellResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_table_cell_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a table from the document node.
    # @param request GetTableOnlineRequest
    # @return [TableResponse]
    def get_table_online(request)
        begin
        data, _status_code, _headers = get_table_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_table_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a table from the document node.
    # @param request GetTableOnlineRequest
    # @return [Array<(TableResponse, Fixnum, Hash)>]
    # TableResponse, response status code and response headers
    private def get_table_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetTableOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_table_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'TableResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_table_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads properties of a table from the document node.
    # @param request GetTablePropertiesRequest
    # @return [TablePropertiesResponse]
    def get_table_properties(request)
        begin
        data, _status_code, _headers = get_table_properties_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_table_properties_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads properties of a table from the document node.
    # @param request GetTablePropertiesRequest
    # @return [Array<(TablePropertiesResponse, Fixnum, Hash)>]
    # TablePropertiesResponse, response status code and response headers
    private def get_table_properties_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetTablePropertiesRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_table_properties ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'TablePropertiesResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_table_properties\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads properties of a table from the document node.
    # @param request GetTablePropertiesOnlineRequest
    # @return [TablePropertiesResponse]
    def get_table_properties_online(request)
        begin
        data, _status_code, _headers = get_table_properties_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_table_properties_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads properties of a table from the document node.
    # @param request GetTablePropertiesOnlineRequest
    # @return [Array<(TablePropertiesResponse, Fixnum, Hash)>]
    # TablePropertiesResponse, response status code and response headers
    private def get_table_properties_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetTablePropertiesOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_table_properties_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'TablePropertiesResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_table_properties_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a row from the table.
    # @param request GetTableRowRequest
    # @return [TableRowResponse]
    def get_table_row(request)
        begin
        data, _status_code, _headers = get_table_row_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_table_row_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a row from the table.
    # @param request GetTableRowRequest
    # @return [Array<(TableRowResponse, Fixnum, Hash)>]
    # TableRowResponse, response status code and response headers
    private def get_table_row_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetTableRowRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_table_row ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'TableRowResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_table_row\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads the formatting properties of a table row.
    # @param request GetTableRowFormatRequest
    # @return [TableRowFormatResponse]
    def get_table_row_format(request)
        begin
        data, _status_code, _headers = get_table_row_format_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_table_row_format_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads the formatting properties of a table row.
    # @param request GetTableRowFormatRequest
    # @return [Array<(TableRowFormatResponse, Fixnum, Hash)>]
    # TableRowFormatResponse, response status code and response headers
    private def get_table_row_format_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetTableRowFormatRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_table_row_format ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'TableRowFormatResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_table_row_format\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads the formatting properties of a table row.
    # @param request GetTableRowFormatOnlineRequest
    # @return [TableRowFormatResponse]
    def get_table_row_format_online(request)
        begin
        data, _status_code, _headers = get_table_row_format_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_table_row_format_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads the formatting properties of a table row.
    # @param request GetTableRowFormatOnlineRequest
    # @return [Array<(TableRowFormatResponse, Fixnum, Hash)>]
    # TableRowFormatResponse, response status code and response headers
    private def get_table_row_format_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetTableRowFormatOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_table_row_format_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'TableRowFormatResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_table_row_format_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads a row from the table.
    # @param request GetTableRowOnlineRequest
    # @return [TableRowResponse]
    def get_table_row_online(request)
        begin
        data, _status_code, _headers = get_table_row_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_table_row_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads a row from the table.
    # @param request GetTableRowOnlineRequest
    # @return [Array<(TableRowResponse, Fixnum, Hash)>]
    # TableRowResponse, response status code and response headers
    private def get_table_row_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetTableRowOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_table_row_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'TableRowResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_table_row_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads tables from the document node.
    # @param request GetTablesRequest
    # @return [TableLinkCollectionResponse]
    def get_tables(request)
        begin
        data, _status_code, _headers = get_tables_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_tables_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads tables from the document node.
    # @param request GetTablesRequest
    # @return [Array<(TableLinkCollectionResponse, Fixnum, Hash)>]
    # TableLinkCollectionResponse, response status code and response headers
    private def get_tables_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetTablesRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_tables ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'TableLinkCollectionResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_tables\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reads tables from the document node.
    # @param request GetTablesOnlineRequest
    # @return [TableLinkCollectionResponse]
    def get_tables_online(request)
        begin
        data, _status_code, _headers = get_tables_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = get_tables_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reads tables from the document node.
    # @param request GetTablesOnlineRequest
    # @return [Array<(TableLinkCollectionResponse, Fixnum, Hash)>]
    # TableLinkCollectionResponse, response status code and response headers
    private def get_tables_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? GetTablesOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.get_tables_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'TableLinkCollectionResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#get_tables_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Inserts a new bookmark to the document.
    # @param request InsertBookmarkRequest
    # @return [BookmarkResponse]
    def insert_bookmark(request)
        begin
        data, _status_code, _headers = insert_bookmark_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_bookmark_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new bookmark to the document.
    # @param request InsertBookmarkRequest
    # @return [Array<(BookmarkResponse, Fixnum, Hash)>]
    # BookmarkResponse, response status code and response headers
    private def insert_bookmark_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertBookmarkRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_bookmark ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'BookmarkResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_bookmark\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Inserts a new bookmark to the document.
    # @param request InsertBookmarkOnlineRequest
    # @return [InsertBookmarkOnlineResponse]
    def insert_bookmark_online(request)
        begin
        data, _status_code, _headers = insert_bookmark_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_bookmark_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new bookmark to the document.
    # @param request InsertBookmarkOnlineRequest
    # @return [Array<(InsertBookmarkOnlineResponse, Fixnum, Hash)>]
    # InsertBookmarkOnlineResponse, response status code and response headers
    private def insert_bookmark_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertBookmarkOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_bookmark_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'InsertBookmarkOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_bookmark_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = InsertBookmarkOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'BookmarkResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Inserts a new comment to the document.
    # @param request InsertCommentRequest
    # @return [CommentResponse]
    def insert_comment(request)
        begin
        data, _status_code, _headers = insert_comment_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_comment_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new comment to the document.
    # @param request InsertCommentRequest
    # @return [Array<(CommentResponse, Fixnum, Hash)>]
    # CommentResponse, response status code and response headers
    private def insert_comment_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertCommentRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_comment ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'CommentResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_comment\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Inserts a new comment to the document.
    # @param request InsertCommentOnlineRequest
    # @return [InsertCommentOnlineResponse]
    def insert_comment_online(request)
        begin
        data, _status_code, _headers = insert_comment_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_comment_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new comment to the document.
    # @param request InsertCommentOnlineRequest
    # @return [Array<(InsertCommentOnlineResponse, Fixnum, Hash)>]
    # InsertCommentOnlineResponse, response status code and response headers
    private def insert_comment_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertCommentOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_comment_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'InsertCommentOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_comment_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = InsertCommentOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'CommentResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Inserts a new custom xml part to the document.
    # @param request InsertCustomXmlPartRequest
    # @return [CustomXmlPartResponse]
    def insert_custom_xml_part(request)
        begin
        data, _status_code, _headers = insert_custom_xml_part_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_custom_xml_part_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new custom xml part to the document.
    # @param request InsertCustomXmlPartRequest
    # @return [Array<(CustomXmlPartResponse, Fixnum, Hash)>]
    # CustomXmlPartResponse, response status code and response headers
    private def insert_custom_xml_part_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertCustomXmlPartRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_custom_xml_part ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'CustomXmlPartResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_custom_xml_part\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Inserts a new custom xml part to the document.
    # @param request InsertCustomXmlPartOnlineRequest
    # @return [InsertCustomXmlPartOnlineResponse]
    def insert_custom_xml_part_online(request)
        begin
        data, _status_code, _headers = insert_custom_xml_part_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_custom_xml_part_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new custom xml part to the document.
    # @param request InsertCustomXmlPartOnlineRequest
    # @return [Array<(InsertCustomXmlPartOnlineResponse, Fixnum, Hash)>]
    # InsertCustomXmlPartOnlineResponse, response status code and response headers
    private def insert_custom_xml_part_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertCustomXmlPartOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_custom_xml_part_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'InsertCustomXmlPartOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_custom_xml_part_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = InsertCustomXmlPartOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'CustomXmlPartResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Inserts a new DrawingObject to the document node.
    # @param request InsertDrawingObjectRequest
    # @return [DrawingObjectResponse]
    def insert_drawing_object(request)
        begin
        data, _status_code, _headers = insert_drawing_object_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_drawing_object_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new DrawingObject to the document node.
    # @param request InsertDrawingObjectRequest
    # @return [Array<(DrawingObjectResponse, Fixnum, Hash)>]
    # DrawingObjectResponse, response status code and response headers
    private def insert_drawing_object_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertDrawingObjectRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_drawing_object ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'DrawingObjectResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_drawing_object\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Inserts a new DrawingObject to the document node.
    # @param request InsertDrawingObjectOnlineRequest
    # @return [InsertDrawingObjectOnlineResponse]
    def insert_drawing_object_online(request)
        begin
        data, _status_code, _headers = insert_drawing_object_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_drawing_object_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new DrawingObject to the document node.
    # @param request InsertDrawingObjectOnlineRequest
    # @return [Array<(InsertDrawingObjectOnlineResponse, Fixnum, Hash)>]
    # InsertDrawingObjectOnlineResponse, response status code and response headers
    private def insert_drawing_object_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertDrawingObjectOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_drawing_object_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'InsertDrawingObjectOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_drawing_object_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = InsertDrawingObjectOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'DrawingObjectResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Inserts a new field to the document node.
    # @param request InsertFieldRequest
    # @return [FieldResponse]
    def insert_field(request)
        begin
        data, _status_code, _headers = insert_field_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_field_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new field to the document node.
    # @param request InsertFieldRequest
    # @return [Array<(FieldResponse, Fixnum, Hash)>]
    # FieldResponse, response status code and response headers
    private def insert_field_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertFieldRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_field ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FieldResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_field\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Inserts a new field to the document node.
    # @param request InsertFieldOnlineRequest
    # @return [InsertFieldOnlineResponse]
    def insert_field_online(request)
        begin
        data, _status_code, _headers = insert_field_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_field_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new field to the document node.
    # @param request InsertFieldOnlineRequest
    # @return [Array<(InsertFieldOnlineResponse, Fixnum, Hash)>]
    # InsertFieldOnlineResponse, response status code and response headers
    private def insert_field_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertFieldOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_field_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'InsertFieldOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_field_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = InsertFieldOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'FieldResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Inserts a new footnote to the document node.
    # @param request InsertFootnoteRequest
    # @return [FootnoteResponse]
    def insert_footnote(request)
        begin
        data, _status_code, _headers = insert_footnote_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_footnote_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new footnote to the document node.
    # @param request InsertFootnoteRequest
    # @return [Array<(FootnoteResponse, Fixnum, Hash)>]
    # FootnoteResponse, response status code and response headers
    private def insert_footnote_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertFootnoteRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_footnote ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FootnoteResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_footnote\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Inserts a new footnote to the document node.
    # @param request InsertFootnoteOnlineRequest
    # @return [InsertFootnoteOnlineResponse]
    def insert_footnote_online(request)
        begin
        data, _status_code, _headers = insert_footnote_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_footnote_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new footnote to the document node.
    # @param request InsertFootnoteOnlineRequest
    # @return [Array<(InsertFootnoteOnlineResponse, Fixnum, Hash)>]
    # InsertFootnoteOnlineResponse, response status code and response headers
    private def insert_footnote_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertFootnoteOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_footnote_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'InsertFootnoteOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_footnote_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = InsertFootnoteOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'FootnoteResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Inserts a new form field to the document node.
    # @param request InsertFormFieldRequest
    # @return [FormFieldResponse]
    def insert_form_field(request)
        begin
        data, _status_code, _headers = insert_form_field_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_form_field_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new form field to the document node.
    # @param request InsertFormFieldRequest
    # @return [Array<(FormFieldResponse, Fixnum, Hash)>]
    # FormFieldResponse, response status code and response headers
    private def insert_form_field_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertFormFieldRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_form_field ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FormFieldResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_form_field\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Inserts a new form field to the document node.
    # @param request InsertFormFieldOnlineRequest
    # @return [InsertFormFieldOnlineResponse]
    def insert_form_field_online(request)
        begin
        data, _status_code, _headers = insert_form_field_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_form_field_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new form field to the document node.
    # @param request InsertFormFieldOnlineRequest
    # @return [Array<(InsertFormFieldOnlineResponse, Fixnum, Hash)>]
    # InsertFormFieldOnlineResponse, response status code and response headers
    private def insert_form_field_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertFormFieldOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_form_field_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'InsertFormFieldOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_form_field_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = InsertFormFieldOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'FormFieldResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Inserts a new HeaderFooter object to the document section.
    # @param request InsertHeaderFooterRequest
    # @return [HeaderFooterResponse]
    def insert_header_footer(request)
        begin
        data, _status_code, _headers = insert_header_footer_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_header_footer_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new HeaderFooter object to the document section.
    # @param request InsertHeaderFooterRequest
    # @return [Array<(HeaderFooterResponse, Fixnum, Hash)>]
    # HeaderFooterResponse, response status code and response headers
    private def insert_header_footer_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertHeaderFooterRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_header_footer ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'HeaderFooterResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_header_footer\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Inserts a new HeaderFooter object to the document section.
    # @param request InsertHeaderFooterOnlineRequest
    # @return [InsertHeaderFooterOnlineResponse]
    def insert_header_footer_online(request)
        begin
        data, _status_code, _headers = insert_header_footer_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_header_footer_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new HeaderFooter object to the document section.
    # @param request InsertHeaderFooterOnlineRequest
    # @return [Array<(InsertHeaderFooterOnlineResponse, Fixnum, Hash)>]
    # InsertHeaderFooterOnlineResponse, response status code and response headers
    private def insert_header_footer_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertHeaderFooterOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_header_footer_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'InsertHeaderFooterOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_header_footer_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = InsertHeaderFooterOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'HeaderFooterResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Inserts a new list to the document.
    # @param request InsertListRequest
    # @return [ListResponse]
    def insert_list(request)
        begin
        data, _status_code, _headers = insert_list_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_list_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new list to the document.
    # @param request InsertListRequest
    # @return [Array<(ListResponse, Fixnum, Hash)>]
    # ListResponse, response status code and response headers
    private def insert_list_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertListRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_list ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'ListResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_list\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Inserts a new list to the document.
    # @param request InsertListOnlineRequest
    # @return [InsertListOnlineResponse]
    def insert_list_online(request)
        begin
        data, _status_code, _headers = insert_list_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_list_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new list to the document.
    # @param request InsertListOnlineRequest
    # @return [Array<(InsertListOnlineResponse, Fixnum, Hash)>]
    # InsertListOnlineResponse, response status code and response headers
    private def insert_list_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertListOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_list_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'InsertListOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_list_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = InsertListOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'ListResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Inserts a new or updates an existing paragraph tab stop in the document node.
    # @param request InsertOrUpdateParagraphTabStopRequest
    # @return [TabStopsResponse]
    def insert_or_update_paragraph_tab_stop(request)
        begin
        data, _status_code, _headers = insert_or_update_paragraph_tab_stop_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_or_update_paragraph_tab_stop_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new or updates an existing paragraph tab stop in the document node.
    # @param request InsertOrUpdateParagraphTabStopRequest
    # @return [Array<(TabStopsResponse, Fixnum, Hash)>]
    # TabStopsResponse, response status code and response headers
    private def insert_or_update_paragraph_tab_stop_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertOrUpdateParagraphTabStopRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_or_update_paragraph_tab_stop ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'TabStopsResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_or_update_paragraph_tab_stop\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Inserts a new or updates an existing paragraph tab stop in the document node.
    # @param request InsertOrUpdateParagraphTabStopOnlineRequest
    # @return [InsertOrUpdateParagraphTabStopOnlineResponse]
    def insert_or_update_paragraph_tab_stop_online(request)
        begin
        data, _status_code, _headers = insert_or_update_paragraph_tab_stop_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_or_update_paragraph_tab_stop_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new or updates an existing paragraph tab stop in the document node.
    # @param request InsertOrUpdateParagraphTabStopOnlineRequest
    # @return [Array<(InsertOrUpdateParagraphTabStopOnlineResponse, Fixnum, Hash)>]
    # InsertOrUpdateParagraphTabStopOnlineResponse, response status code and response headers
    private def insert_or_update_paragraph_tab_stop_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertOrUpdateParagraphTabStopOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_or_update_paragraph_tab_stop_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'InsertOrUpdateParagraphTabStopOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_or_update_paragraph_tab_stop_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = InsertOrUpdateParagraphTabStopOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'TabStopsResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Inserts page numbers to the document.
    # @param request InsertPageNumbersRequest
    # @return [DocumentResponse]
    def insert_page_numbers(request)
        begin
        data, _status_code, _headers = insert_page_numbers_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_page_numbers_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts page numbers to the document.
    # @param request InsertPageNumbersRequest
    # @return [Array<(DocumentResponse, Fixnum, Hash)>]
    # DocumentResponse, response status code and response headers
    private def insert_page_numbers_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertPageNumbersRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_page_numbers ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'DocumentResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_page_numbers\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Inserts page numbers to the document.
    # @param request InsertPageNumbersOnlineRequest
    # @return [InsertPageNumbersOnlineResponse]
    def insert_page_numbers_online(request)
        begin
        data, _status_code, _headers = insert_page_numbers_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_page_numbers_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts page numbers to the document.
    # @param request InsertPageNumbersOnlineRequest
    # @return [Array<(InsertPageNumbersOnlineResponse, Fixnum, Hash)>]
    # InsertPageNumbersOnlineResponse, response status code and response headers
    private def insert_page_numbers_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertPageNumbersOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_page_numbers_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'InsertPageNumbersOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_page_numbers_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = InsertPageNumbersOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'DocumentResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Inserts a new paragraph to the document node.
    # @param request InsertParagraphRequest
    # @return [ParagraphResponse]
    def insert_paragraph(request)
        begin
        data, _status_code, _headers = insert_paragraph_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_paragraph_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new paragraph to the document node.
    # @param request InsertParagraphRequest
    # @return [Array<(ParagraphResponse, Fixnum, Hash)>]
    # ParagraphResponse, response status code and response headers
    private def insert_paragraph_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertParagraphRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_paragraph ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'ParagraphResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_paragraph\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Inserts a new paragraph to the document node.
    # @param request InsertParagraphOnlineRequest
    # @return [InsertParagraphOnlineResponse]
    def insert_paragraph_online(request)
        begin
        data, _status_code, _headers = insert_paragraph_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_paragraph_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new paragraph to the document node.
    # @param request InsertParagraphOnlineRequest
    # @return [Array<(InsertParagraphOnlineResponse, Fixnum, Hash)>]
    # InsertParagraphOnlineResponse, response status code and response headers
    private def insert_paragraph_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertParagraphOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_paragraph_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'InsertParagraphOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_paragraph_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = InsertParagraphOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'ParagraphResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Inserts a new Run object to the paragraph.
    # @param request InsertRunRequest
    # @return [RunResponse]
    def insert_run(request)
        begin
        data, _status_code, _headers = insert_run_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_run_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new Run object to the paragraph.
    # @param request InsertRunRequest
    # @return [Array<(RunResponse, Fixnum, Hash)>]
    # RunResponse, response status code and response headers
    private def insert_run_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertRunRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_run ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'RunResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_run\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Inserts a new Run object to the paragraph.
    # @param request InsertRunOnlineRequest
    # @return [InsertRunOnlineResponse]
    def insert_run_online(request)
        begin
        data, _status_code, _headers = insert_run_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_run_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new Run object to the paragraph.
    # @param request InsertRunOnlineRequest
    # @return [Array<(InsertRunOnlineResponse, Fixnum, Hash)>]
    # InsertRunOnlineResponse, response status code and response headers
    private def insert_run_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertRunOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_run_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'InsertRunOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_run_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = InsertRunOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'RunResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Inserts a section to the document.
    # @param request InsertSectionRequest
    # @return [nil]
    def insert_section(request)
        begin
        data, _status_code, _headers = insert_section_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_section_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Inserts a section to the document.
    # @param request InsertSectionRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def insert_section_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertSectionRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_section ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_section\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Inserts a section to the document.
    # @param request InsertSectionOnlineRequest
    # @return [FILES_COLLECTION]
    def insert_section_online(request)
        begin
        data, _status_code, _headers = insert_section_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_section_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a section to the document.
    # @param request InsertSectionOnlineRequest
    # @return [Array<(FILES_COLLECTION, Fixnum, Hash)>]
    # FILES_COLLECTION, response status code and response headers
    private def insert_section_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertSectionOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_section_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FILES_COLLECTION')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_section_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        # FILES_COLLECTION #
        [data, status_code, headers]
    end

    # Inserts a new StructuredDocumentTag (SDT) to the document node.
    # @param request InsertStructuredDocumentTagRequest
    # @return [StructuredDocumentTagResponse]
    def insert_structured_document_tag(request)
        begin
        data, _status_code, _headers = insert_structured_document_tag_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_structured_document_tag_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new StructuredDocumentTag (SDT) to the document node.
    # @param request InsertStructuredDocumentTagRequest
    # @return [Array<(StructuredDocumentTagResponse, Fixnum, Hash)>]
    # StructuredDocumentTagResponse, response status code and response headers
    private def insert_structured_document_tag_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertStructuredDocumentTagRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_structured_document_tag ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'StructuredDocumentTagResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_structured_document_tag\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Inserts a new StructuredDocumentTag (SDT) to the document node.
    # @param request InsertStructuredDocumentTagOnlineRequest
    # @return [InsertStructuredDocumentTagOnlineResponse]
    def insert_structured_document_tag_online(request)
        begin
        data, _status_code, _headers = insert_structured_document_tag_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_structured_document_tag_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new StructuredDocumentTag (SDT) to the document node.
    # @param request InsertStructuredDocumentTagOnlineRequest
    # @return [Array<(InsertStructuredDocumentTagOnlineResponse, Fixnum, Hash)>]
    # InsertStructuredDocumentTagOnlineResponse, response status code and response headers
    private def insert_structured_document_tag_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertStructuredDocumentTagOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_structured_document_tag_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'InsertStructuredDocumentTagOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_structured_document_tag_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = InsertStructuredDocumentTagOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'StructuredDocumentTagResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Inserts a new style to the document.
    # @param request InsertStyleRequest
    # @return [StyleResponse]
    def insert_style(request)
        begin
        data, _status_code, _headers = insert_style_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_style_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new style to the document.
    # @param request InsertStyleRequest
    # @return [Array<(StyleResponse, Fixnum, Hash)>]
    # StyleResponse, response status code and response headers
    private def insert_style_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertStyleRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_style ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'StyleResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_style\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Inserts a new style to the document.
    # @param request InsertStyleOnlineRequest
    # @return [InsertStyleOnlineResponse]
    def insert_style_online(request)
        begin
        data, _status_code, _headers = insert_style_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_style_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new style to the document.
    # @param request InsertStyleOnlineRequest
    # @return [Array<(InsertStyleOnlineResponse, Fixnum, Hash)>]
    # InsertStyleOnlineResponse, response status code and response headers
    private def insert_style_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertStyleOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_style_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'InsertStyleOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_style_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = InsertStyleOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'StyleResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Inserts a new table to the document node.
    # @param request InsertTableRequest
    # @return [TableResponse]
    def insert_table(request)
        begin
        data, _status_code, _headers = insert_table_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_table_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new table to the document node.
    # @param request InsertTableRequest
    # @return [Array<(TableResponse, Fixnum, Hash)>]
    # TableResponse, response status code and response headers
    private def insert_table_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertTableRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_table ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'TableResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_table\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Inserts a new cell to the table row.
    # @param request InsertTableCellRequest
    # @return [TableCellResponse]
    def insert_table_cell(request)
        begin
        data, _status_code, _headers = insert_table_cell_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_table_cell_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new cell to the table row.
    # @param request InsertTableCellRequest
    # @return [Array<(TableCellResponse, Fixnum, Hash)>]
    # TableCellResponse, response status code and response headers
    private def insert_table_cell_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertTableCellRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_table_cell ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'TableCellResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_table_cell\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Inserts a new cell to the table row.
    # @param request InsertTableCellOnlineRequest
    # @return [InsertTableCellOnlineResponse]
    def insert_table_cell_online(request)
        begin
        data, _status_code, _headers = insert_table_cell_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_table_cell_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new cell to the table row.
    # @param request InsertTableCellOnlineRequest
    # @return [Array<(InsertTableCellOnlineResponse, Fixnum, Hash)>]
    # InsertTableCellOnlineResponse, response status code and response headers
    private def insert_table_cell_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertTableCellOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_table_cell_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'InsertTableCellOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_table_cell_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = InsertTableCellOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'TableCellResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Inserts a new table to the document node.
    # @param request InsertTableOnlineRequest
    # @return [InsertTableOnlineResponse]
    def insert_table_online(request)
        begin
        data, _status_code, _headers = insert_table_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_table_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new table to the document node.
    # @param request InsertTableOnlineRequest
    # @return [Array<(InsertTableOnlineResponse, Fixnum, Hash)>]
    # InsertTableOnlineResponse, response status code and response headers
    private def insert_table_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertTableOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_table_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'InsertTableOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_table_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = InsertTableOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'TableResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Inserts a new row to the table.
    # @param request InsertTableRowRequest
    # @return [TableRowResponse]
    def insert_table_row(request)
        begin
        data, _status_code, _headers = insert_table_row_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_table_row_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new row to the table.
    # @param request InsertTableRowRequest
    # @return [Array<(TableRowResponse, Fixnum, Hash)>]
    # TableRowResponse, response status code and response headers
    private def insert_table_row_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertTableRowRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_table_row ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'TableRowResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_table_row\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Inserts a new row to the table.
    # @param request InsertTableRowOnlineRequest
    # @return [InsertTableRowOnlineResponse]
    def insert_table_row_online(request)
        begin
        data, _status_code, _headers = insert_table_row_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_table_row_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new row to the table.
    # @param request InsertTableRowOnlineRequest
    # @return [Array<(InsertTableRowOnlineResponse, Fixnum, Hash)>]
    # InsertTableRowOnlineResponse, response status code and response headers
    private def insert_table_row_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertTableRowOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_table_row_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'InsertTableRowOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_table_row_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = InsertTableRowOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'TableRowResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Insert a watermark to the document.
    # @param request InsertWatermarkRequest
    # @return [DocumentResponse]
    def insert_watermark(request)
        begin
        data, _status_code, _headers = insert_watermark_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_watermark_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Insert a watermark to the document.
    # @param request InsertWatermarkRequest
    # @return [Array<(DocumentResponse, Fixnum, Hash)>]
    # DocumentResponse, response status code and response headers
    private def insert_watermark_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertWatermarkRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_watermark ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'DocumentResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_watermark\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Inserts a new watermark image to the document.
    # @param request InsertWatermarkImageRequest
    # @return [DocumentResponse]
    def insert_watermark_image(request)
        warn "This operation is deprecated and is used for backward compatibility only. Please use InsertWatermark instead."
        begin
        data, _status_code, _headers = insert_watermark_image_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_watermark_image_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new watermark image to the document.
    # @param request InsertWatermarkImageRequest
    # @return [Array<(DocumentResponse, Fixnum, Hash)>]
    # DocumentResponse, response status code and response headers
    private def insert_watermark_image_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertWatermarkImageRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_watermark_image ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'DocumentResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_watermark_image\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Inserts a new watermark image to the document.
    # @param request InsertWatermarkImageOnlineRequest
    # @return [InsertWatermarkImageOnlineResponse]
    def insert_watermark_image_online(request)
        warn "This operation is deprecated and is used for backward compatibility only. Please use InsertWatermark instead."
        begin
        data, _status_code, _headers = insert_watermark_image_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_watermark_image_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new watermark image to the document.
    # @param request InsertWatermarkImageOnlineRequest
    # @return [Array<(InsertWatermarkImageOnlineResponse, Fixnum, Hash)>]
    # InsertWatermarkImageOnlineResponse, response status code and response headers
    private def insert_watermark_image_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertWatermarkImageOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_watermark_image_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'InsertWatermarkImageOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_watermark_image_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = InsertWatermarkImageOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'DocumentResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Insert a watermark to the document.
    # @param request InsertWatermarkOnlineRequest
    # @return [InsertWatermarkOnlineResponse]
    def insert_watermark_online(request)
        begin
        data, _status_code, _headers = insert_watermark_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_watermark_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Insert a watermark to the document.
    # @param request InsertWatermarkOnlineRequest
    # @return [Array<(InsertWatermarkOnlineResponse, Fixnum, Hash)>]
    # InsertWatermarkOnlineResponse, response status code and response headers
    private def insert_watermark_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertWatermarkOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_watermark_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'InsertWatermarkOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_watermark_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = InsertWatermarkOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'DocumentResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Inserts a new watermark text to the document.
    # @param request InsertWatermarkTextRequest
    # @return [DocumentResponse]
    def insert_watermark_text(request)
        warn "This operation is deprecated and is used for backward compatibility only. Please use InsertWatermark instead."
        begin
        data, _status_code, _headers = insert_watermark_text_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_watermark_text_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new watermark text to the document.
    # @param request InsertWatermarkTextRequest
    # @return [Array<(DocumentResponse, Fixnum, Hash)>]
    # DocumentResponse, response status code and response headers
    private def insert_watermark_text_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertWatermarkTextRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_watermark_text ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'DocumentResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_watermark_text\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Inserts a new watermark text to the document.
    # @param request InsertWatermarkTextOnlineRequest
    # @return [InsertWatermarkTextOnlineResponse]
    def insert_watermark_text_online(request)
        warn "This operation is deprecated and is used for backward compatibility only. Please use InsertWatermark instead."
        begin
        data, _status_code, _headers = insert_watermark_text_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = insert_watermark_text_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Inserts a new watermark text to the document.
    # @param request InsertWatermarkTextOnlineRequest
    # @return [Array<(InsertWatermarkTextOnlineResponse, Fixnum, Hash)>]
    # InsertWatermarkTextOnlineResponse, response status code and response headers
    private def insert_watermark_text_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? InsertWatermarkTextOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.insert_watermark_text_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'InsertWatermarkTextOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#insert_watermark_text_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = InsertWatermarkTextOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'DocumentResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Links headers / footers of the section to the previous one.
    # @param request LinkHeaderFootersToPreviousRequest
    # @return [nil]
    def link_header_footers_to_previous(request)
        begin
        data, _status_code, _headers = link_header_footers_to_previous_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = link_header_footers_to_previous_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Links headers / footers of the section to the previous one.
    # @param request LinkHeaderFootersToPreviousRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def link_header_footers_to_previous_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? LinkHeaderFootersToPreviousRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.link_header_footers_to_previous ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#link_header_footers_to_previous\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Downloads a document from the Web using URL and saves it to cloud storage in the specified format.
    # @param request LoadWebDocumentRequest
    # @return [SaveResponse]
    def load_web_document(request)
        begin
        data, _status_code, _headers = load_web_document_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = load_web_document_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Downloads a document from the Web using URL and saves it to cloud storage in the specified format.
    # @param request LoadWebDocumentRequest
    # @return [Array<(SaveResponse, Fixnum, Hash)>]
    # SaveResponse, response status code and response headers
    private def load_web_document_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? LoadWebDocumentRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.load_web_document ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'SaveResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#load_web_document\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Downloads a document from the Web using URL and saves it to cloud storage in the specified format.
    # @param request LoadWebDocumentOnlineRequest
    # @return [LoadWebDocumentOnlineResponse]
    def load_web_document_online(request)
        begin
        data, _status_code, _headers = load_web_document_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = load_web_document_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Downloads a document from the Web using URL and saves it to cloud storage in the specified format.
    # @param request LoadWebDocumentOnlineRequest
    # @return [Array<(LoadWebDocumentOnlineResponse, Fixnum, Hash)>]
    # LoadWebDocumentOnlineResponse, response status code and response headers
    private def load_web_document_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? LoadWebDocumentOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.load_web_document_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'LoadWebDocumentOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#load_web_document_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = LoadWebDocumentOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'SaveResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Merge the section with the next one.
    # @param request MergeWithNextRequest
    # @return [nil]
    def merge_with_next(request)
        begin
        data, _status_code, _headers = merge_with_next_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = merge_with_next_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Merge the section with the next one.
    # @param request MergeWithNextRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def merge_with_next_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? MergeWithNextRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.merge_with_next ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#merge_with_next\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Merge the section with the next one.
    # @param request MergeWithNextOnlineRequest
    # @return [FILES_COLLECTION]
    def merge_with_next_online(request)
        begin
        data, _status_code, _headers = merge_with_next_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = merge_with_next_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Merge the section with the next one.
    # @param request MergeWithNextOnlineRequest
    # @return [Array<(FILES_COLLECTION, Fixnum, Hash)>]
    # FILES_COLLECTION, response status code and response headers
    private def merge_with_next_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? MergeWithNextOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.merge_with_next_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FILES_COLLECTION')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#merge_with_next_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        # FILES_COLLECTION #
        [data, status_code, headers]
    end

    # Move file.
    # @param request MoveFileRequest
    # @return [nil]
    def move_file(request)
        begin
        data, _status_code, _headers = move_file_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = move_file_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Move file.
    # @param request MoveFileRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def move_file_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? MoveFileRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.move_file ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#move_file\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Move folder.
    # @param request MoveFolderRequest
    # @return [nil]
    def move_folder(request)
        begin
        data, _status_code, _headers = move_folder_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = move_folder_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Move folder.
    # @param request MoveFolderRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def move_folder_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? MoveFolderRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.move_folder ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#move_folder\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Applies document content optimization options, specific to a particular versions of Microsoft Word.
    # @param request OptimizeDocumentRequest
    # @return [nil]
    def optimize_document(request)
        begin
        data, _status_code, _headers = optimize_document_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = optimize_document_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Applies document content optimization options, specific to a particular versions of Microsoft Word.
    # @param request OptimizeDocumentRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def optimize_document_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? OptimizeDocumentRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.optimize_document ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#optimize_document\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Applies document content optimization options, specific to a particular versions of Microsoft Word.
    # @param request OptimizeDocumentOnlineRequest
    # @return [FILES_COLLECTION]
    def optimize_document_online(request)
        begin
        data, _status_code, _headers = optimize_document_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = optimize_document_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Applies document content optimization options, specific to a particular versions of Microsoft Word.
    # @param request OptimizeDocumentOnlineRequest
    # @return [Array<(FILES_COLLECTION, Fixnum, Hash)>]
    # FILES_COLLECTION, response status code and response headers
    private def optimize_document_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? OptimizeDocumentOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.optimize_document_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FILES_COLLECTION')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#optimize_document_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        # FILES_COLLECTION #
        [data, status_code, headers]
    end

    # Changes the document protection. The previous protection will be overwritten if it exist.
    # @param request ProtectDocumentRequest
    # @return [ProtectionDataResponse]
    def protect_document(request)
        begin
        data, _status_code, _headers = protect_document_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = protect_document_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Changes the document protection. The previous protection will be overwritten if it exist.
    # @param request ProtectDocumentRequest
    # @return [Array<(ProtectionDataResponse, Fixnum, Hash)>]
    # ProtectionDataResponse, response status code and response headers
    private def protect_document_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? ProtectDocumentRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.protect_document ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'ProtectionDataResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#protect_document\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Changes the document protection. The previous protection will be overwritten if it exist.
    # @param request ProtectDocumentOnlineRequest
    # @return [ProtectDocumentOnlineResponse]
    def protect_document_online(request)
        begin
        data, _status_code, _headers = protect_document_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = protect_document_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Changes the document protection. The previous protection will be overwritten if it exist.
    # @param request ProtectDocumentOnlineRequest
    # @return [Array<(ProtectDocumentOnlineResponse, Fixnum, Hash)>]
    # ProtectDocumentOnlineResponse, response status code and response headers
    private def protect_document_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? ProtectDocumentOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.protect_document_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'ProtectDocumentOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#protect_document_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = ProtectDocumentOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'ProtectionDataResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Rejects all revisions in the document.
    # @param request RejectAllRevisionsRequest
    # @return [RevisionsModificationResponse]
    def reject_all_revisions(request)
        begin
        data, _status_code, _headers = reject_all_revisions_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = reject_all_revisions_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Rejects all revisions in the document.
    # @param request RejectAllRevisionsRequest
    # @return [Array<(RevisionsModificationResponse, Fixnum, Hash)>]
    # RevisionsModificationResponse, response status code and response headers
    private def reject_all_revisions_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? RejectAllRevisionsRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.reject_all_revisions ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'RevisionsModificationResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#reject_all_revisions\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Rejects all revisions in the document.
    # @param request RejectAllRevisionsOnlineRequest
    # @return [RejectAllRevisionsOnlineResponse]
    def reject_all_revisions_online(request)
        begin
        data, _status_code, _headers = reject_all_revisions_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = reject_all_revisions_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Rejects all revisions in the document.
    # @param request RejectAllRevisionsOnlineRequest
    # @return [Array<(RejectAllRevisionsOnlineResponse, Fixnum, Hash)>]
    # RejectAllRevisionsOnlineResponse, response status code and response headers
    private def reject_all_revisions_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? RejectAllRevisionsOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.reject_all_revisions_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'RejectAllRevisionsOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#reject_all_revisions_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = RejectAllRevisionsOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'RevisionsModificationResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Removes all signatures of the document.
    # @param request RemoveAllSignaturesRequest
    # @return [SignatureCollectionResponse]
    def remove_all_signatures(request)
        begin
        data, _status_code, _headers = remove_all_signatures_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = remove_all_signatures_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes all signatures of the document.
    # @param request RemoveAllSignaturesRequest
    # @return [Array<(SignatureCollectionResponse, Fixnum, Hash)>]
    # SignatureCollectionResponse, response status code and response headers
    private def remove_all_signatures_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? RemoveAllSignaturesRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.remove_all_signatures ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'SignatureCollectionResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#remove_all_signatures\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes all signatures of the document.
    # @param request RemoveAllSignaturesOnlineRequest
    # @return [RemoveAllSignaturesOnlineResponse]
    def remove_all_signatures_online(request)
        begin
        data, _status_code, _headers = remove_all_signatures_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = remove_all_signatures_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes all signatures of the document.
    # @param request RemoveAllSignaturesOnlineRequest
    # @return [Array<(RemoveAllSignaturesOnlineResponse, Fixnum, Hash)>]
    # RemoveAllSignaturesOnlineResponse, response status code and response headers
    private def remove_all_signatures_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? RemoveAllSignaturesOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.remove_all_signatures_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'RemoveAllSignaturesOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#remove_all_signatures_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = RemoveAllSignaturesOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'SignatureCollectionResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Removes a range from the document.
    # @param request RemoveRangeRequest
    # @return [DocumentResponse]
    def remove_range(request)
        begin
        data, _status_code, _headers = remove_range_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = remove_range_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes a range from the document.
    # @param request RemoveRangeRequest
    # @return [Array<(DocumentResponse, Fixnum, Hash)>]
    # DocumentResponse, response status code and response headers
    private def remove_range_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? RemoveRangeRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.remove_range ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'DocumentResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#remove_range\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes a range from the document.
    # @param request RemoveRangeOnlineRequest
    # @return [RemoveRangeOnlineResponse]
    def remove_range_online(request)
        begin
        data, _status_code, _headers = remove_range_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = remove_range_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes a range from the document.
    # @param request RemoveRangeOnlineRequest
    # @return [Array<(RemoveRangeOnlineResponse, Fixnum, Hash)>]
    # RemoveRangeOnlineResponse, response status code and response headers
    private def remove_range_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? RemoveRangeOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.remove_range_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'RemoveRangeOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#remove_range_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = RemoveRangeOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'DocumentResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Renders a DrawingObject to the specified format.
    # @param request RenderDrawingObjectRequest
    # @return [File]
    def render_drawing_object(request)
        begin
        data, _status_code, _headers = render_drawing_object_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = render_drawing_object_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Renders a DrawingObject to the specified format.
    # @param request RenderDrawingObjectRequest
    # @return [Array<(File, Fixnum, Hash)>]
    # File, response status code and response headers
    private def render_drawing_object_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? RenderDrawingObjectRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.render_drawing_object ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'File')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#render_drawing_object\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Renders a DrawingObject to the specified format.
    # @param request RenderDrawingObjectOnlineRequest
    # @return [File]
    def render_drawing_object_online(request)
        begin
        data, _status_code, _headers = render_drawing_object_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = render_drawing_object_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Renders a DrawingObject to the specified format.
    # @param request RenderDrawingObjectOnlineRequest
    # @return [Array<(File, Fixnum, Hash)>]
    # File, response status code and response headers
    private def render_drawing_object_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? RenderDrawingObjectOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.render_drawing_object_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'File')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#render_drawing_object_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Renders an OfficeMath object to the specified format.
    # @param request RenderMathObjectRequest
    # @return [File]
    def render_math_object(request)
        begin
        data, _status_code, _headers = render_math_object_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = render_math_object_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Renders an OfficeMath object to the specified format.
    # @param request RenderMathObjectRequest
    # @return [Array<(File, Fixnum, Hash)>]
    # File, response status code and response headers
    private def render_math_object_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? RenderMathObjectRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.render_math_object ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'File')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#render_math_object\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Renders an OfficeMath object to the specified format.
    # @param request RenderMathObjectOnlineRequest
    # @return [File]
    def render_math_object_online(request)
        begin
        data, _status_code, _headers = render_math_object_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = render_math_object_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Renders an OfficeMath object to the specified format.
    # @param request RenderMathObjectOnlineRequest
    # @return [Array<(File, Fixnum, Hash)>]
    # File, response status code and response headers
    private def render_math_object_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? RenderMathObjectOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.render_math_object_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'File')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#render_math_object_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Renders a page to the specified format.
    # @param request RenderPageRequest
    # @return [File]
    def render_page(request)
        begin
        data, _status_code, _headers = render_page_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = render_page_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Renders a page to the specified format.
    # @param request RenderPageRequest
    # @return [Array<(File, Fixnum, Hash)>]
    # File, response status code and response headers
    private def render_page_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? RenderPageRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.render_page ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'File')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#render_page\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Renders a page to the specified format.
    # @param request RenderPageOnlineRequest
    # @return [File]
    def render_page_online(request)
        begin
        data, _status_code, _headers = render_page_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = render_page_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Renders a page to the specified format.
    # @param request RenderPageOnlineRequest
    # @return [Array<(File, Fixnum, Hash)>]
    # File, response status code and response headers
    private def render_page_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? RenderPageOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.render_page_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'File')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#render_page_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Renders a paragraph to the specified format.
    # @param request RenderParagraphRequest
    # @return [File]
    def render_paragraph(request)
        begin
        data, _status_code, _headers = render_paragraph_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = render_paragraph_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Renders a paragraph to the specified format.
    # @param request RenderParagraphRequest
    # @return [Array<(File, Fixnum, Hash)>]
    # File, response status code and response headers
    private def render_paragraph_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? RenderParagraphRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.render_paragraph ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'File')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#render_paragraph\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Renders a paragraph to the specified format.
    # @param request RenderParagraphOnlineRequest
    # @return [File]
    def render_paragraph_online(request)
        begin
        data, _status_code, _headers = render_paragraph_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = render_paragraph_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Renders a paragraph to the specified format.
    # @param request RenderParagraphOnlineRequest
    # @return [Array<(File, Fixnum, Hash)>]
    # File, response status code and response headers
    private def render_paragraph_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? RenderParagraphOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.render_paragraph_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'File')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#render_paragraph_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Renders a table to the specified format.
    # @param request RenderTableRequest
    # @return [File]
    def render_table(request)
        begin
        data, _status_code, _headers = render_table_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = render_table_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Renders a table to the specified format.
    # @param request RenderTableRequest
    # @return [Array<(File, Fixnum, Hash)>]
    # File, response status code and response headers
    private def render_table_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? RenderTableRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.render_table ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'File')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#render_table\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Renders a table to the specified format.
    # @param request RenderTableOnlineRequest
    # @return [File]
    def render_table_online(request)
        begin
        data, _status_code, _headers = render_table_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = render_table_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Renders a table to the specified format.
    # @param request RenderTableOnlineRequest
    # @return [Array<(File, Fixnum, Hash)>]
    # File, response status code and response headers
    private def render_table_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? RenderTableOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.render_table_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'File')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#render_table_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Replaces text in the document.
    # @param request ReplaceTextRequest
    # @return [ReplaceTextResponse]
    def replace_text(request)
        begin
        data, _status_code, _headers = replace_text_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = replace_text_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Replaces text in the document.
    # @param request ReplaceTextRequest
    # @return [Array<(ReplaceTextResponse, Fixnum, Hash)>]
    # ReplaceTextResponse, response status code and response headers
    private def replace_text_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? ReplaceTextRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.replace_text ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'ReplaceTextResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#replace_text\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Replaces text in the document.
    # @param request ReplaceTextOnlineRequest
    # @return [ReplaceTextOnlineResponse]
    def replace_text_online(request)
        begin
        data, _status_code, _headers = replace_text_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = replace_text_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Replaces text in the document.
    # @param request ReplaceTextOnlineRequest
    # @return [Array<(ReplaceTextOnlineResponse, Fixnum, Hash)>]
    # ReplaceTextOnlineResponse, response status code and response headers
    private def replace_text_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? ReplaceTextOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.replace_text_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'ReplaceTextOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#replace_text_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = ReplaceTextOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'ReplaceTextResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Replaces a range with text in the document.
    # @param request ReplaceWithTextRequest
    # @return [DocumentResponse]
    def replace_with_text(request)
        begin
        data, _status_code, _headers = replace_with_text_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = replace_with_text_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Replaces a range with text in the document.
    # @param request ReplaceWithTextRequest
    # @return [Array<(DocumentResponse, Fixnum, Hash)>]
    # DocumentResponse, response status code and response headers
    private def replace_with_text_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? ReplaceWithTextRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.replace_with_text ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'DocumentResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#replace_with_text\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Replaces a range with text in the document.
    # @param request ReplaceWithTextOnlineRequest
    # @return [ReplaceWithTextOnlineResponse]
    def replace_with_text_online(request)
        begin
        data, _status_code, _headers = replace_with_text_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = replace_with_text_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Replaces a range with text in the document.
    # @param request ReplaceWithTextOnlineRequest
    # @return [Array<(ReplaceWithTextOnlineResponse, Fixnum, Hash)>]
    # ReplaceWithTextOnlineResponse, response status code and response headers
    private def replace_with_text_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? ReplaceWithTextOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.replace_with_text_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'ReplaceWithTextOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#replace_with_text_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = ReplaceWithTextOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'DocumentResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Clears the font cache.
    # @param request ResetCacheRequest
    # @return [nil]
    def reset_cache(request)
        begin
        data, _status_code, _headers = reset_cache_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = reset_cache_with_http_info(request)
            else
            raise
            end
        end
        nil
    end

    # Clears the font cache.
    # @param request ResetCacheRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def reset_cache_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? ResetCacheRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.reset_cache ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'])
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#reset_cache\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Converts a document in cloud storage to the specified format.
    # @param request SaveAsRequest
    # @return [SaveResponse]
    def save_as(request)
        begin
        data, _status_code, _headers = save_as_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = save_as_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Converts a document in cloud storage to the specified format.
    # @param request SaveAsRequest
    # @return [Array<(SaveResponse, Fixnum, Hash)>]
    # SaveResponse, response status code and response headers
    private def save_as_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? SaveAsRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.save_as ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'SaveResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#save_as\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Converts a document in cloud storage to the specified format.
    # @param request SaveAsOnlineRequest
    # @return [SaveAsOnlineResponse]
    def save_as_online(request)
        begin
        data, _status_code, _headers = save_as_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = save_as_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Converts a document in cloud storage to the specified format.
    # @param request SaveAsOnlineRequest
    # @return [Array<(SaveAsOnlineResponse, Fixnum, Hash)>]
    # SaveAsOnlineResponse, response status code and response headers
    private def save_as_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? SaveAsOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.save_as_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'SaveAsOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#save_as_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = SaveAsOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'SaveResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Saves a range as a new document.
    # @param request SaveAsRangeRequest
    # @return [DocumentResponse]
    def save_as_range(request)
        begin
        data, _status_code, _headers = save_as_range_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = save_as_range_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Saves a range as a new document.
    # @param request SaveAsRangeRequest
    # @return [Array<(DocumentResponse, Fixnum, Hash)>]
    # DocumentResponse, response status code and response headers
    private def save_as_range_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? SaveAsRangeRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.save_as_range ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'DocumentResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#save_as_range\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Saves a range as a new document.
    # @param request SaveAsRangeOnlineRequest
    # @return [SaveAsRangeOnlineResponse]
    def save_as_range_online(request)
        begin
        data, _status_code, _headers = save_as_range_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = save_as_range_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Saves a range as a new document.
    # @param request SaveAsRangeOnlineRequest
    # @return [Array<(SaveAsRangeOnlineResponse, Fixnum, Hash)>]
    # SaveAsRangeOnlineResponse, response status code and response headers
    private def save_as_range_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? SaveAsRangeOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.save_as_range_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'SaveAsRangeOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#save_as_range_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = SaveAsRangeOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'DocumentResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Converts a document in cloud storage to TIFF format using detailed conversion settings.
    # @param request SaveAsTiffRequest
    # @return [SaveResponse]
    def save_as_tiff(request)
        warn "This operation will be removed in the future."
        begin
        data, _status_code, _headers = save_as_tiff_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = save_as_tiff_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Converts a document in cloud storage to TIFF format using detailed conversion settings.
    # @param request SaveAsTiffRequest
    # @return [Array<(SaveResponse, Fixnum, Hash)>]
    # SaveResponse, response status code and response headers
    private def save_as_tiff_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? SaveAsTiffRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.save_as_tiff ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'SaveResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#save_as_tiff\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Converts a document in cloud storage to TIFF format using detailed conversion settings.
    # @param request SaveAsTiffOnlineRequest
    # @return [SaveAsTiffOnlineResponse]
    def save_as_tiff_online(request)
        warn "This operation will be removed in the future."
        begin
        data, _status_code, _headers = save_as_tiff_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = save_as_tiff_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Converts a document in cloud storage to TIFF format using detailed conversion settings.
    # @param request SaveAsTiffOnlineRequest
    # @return [Array<(SaveAsTiffOnlineResponse, Fixnum, Hash)>]
    # SaveAsTiffOnlineResponse, response status code and response headers
    private def save_as_tiff_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? SaveAsTiffOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.save_as_tiff_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'SaveAsTiffOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#save_as_tiff_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = SaveAsTiffOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'SaveResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Searches text, specified by the regular expression, in the document.
    # @param request SearchRequest
    # @return [SearchResponse]
    def search(request)
        begin
        data, _status_code, _headers = search_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = search_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Searches text, specified by the regular expression, in the document.
    # @param request SearchRequest
    # @return [Array<(SearchResponse, Fixnum, Hash)>]
    # SearchResponse, response status code and response headers
    private def search_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? SearchRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.search ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'SearchResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#search\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Searches text, specified by the regular expression, in the document.
    # @param request SearchOnlineRequest
    # @return [SearchResponse]
    def search_online(request)
        begin
        data, _status_code, _headers = search_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = search_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Searches text, specified by the regular expression, in the document.
    # @param request SearchOnlineRequest
    # @return [Array<(SearchResponse, Fixnum, Hash)>]
    # SearchResponse, response status code and response headers
    private def search_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? SearchOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.search_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'SearchResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#search_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Signs the document with given certificate.
    # @param request SignDocumentRequest
    # @return [SignatureCollectionResponse]
    def sign_document(request)
        begin
        data, _status_code, _headers = sign_document_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = sign_document_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Signs the document with given certificate.
    # @param request SignDocumentRequest
    # @return [Array<(SignatureCollectionResponse, Fixnum, Hash)>]
    # SignatureCollectionResponse, response status code and response headers
    private def sign_document_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? SignDocumentRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.sign_document ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'SignatureCollectionResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#sign_document\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Signs the document with given certificate.
    # @param request SignDocumentOnlineRequest
    # @return [SignDocumentOnlineResponse]
    def sign_document_online(request)
        begin
        data, _status_code, _headers = sign_document_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = sign_document_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Signs the document with given certificate.
    # @param request SignDocumentOnlineRequest
    # @return [Array<(SignDocumentOnlineResponse, Fixnum, Hash)>]
    # SignDocumentOnlineResponse, response status code and response headers
    private def sign_document_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? SignDocumentOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.sign_document_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'SignDocumentOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#sign_document_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = SignDocumentOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'SignatureCollectionResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Splits a document into parts and saves them in the specified format.
    # @param request SplitDocumentRequest
    # @return [SplitDocumentResponse]
    def split_document(request)
        begin
        data, _status_code, _headers = split_document_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = split_document_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Splits a document into parts and saves them in the specified format.
    # @param request SplitDocumentRequest
    # @return [Array<(SplitDocumentResponse, Fixnum, Hash)>]
    # SplitDocumentResponse, response status code and response headers
    private def split_document_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? SplitDocumentRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.split_document ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'SplitDocumentResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#split_document\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Splits a document into parts and saves them in the specified format.
    # @param request SplitDocumentJobRequest
    # @return [JobHandler]
    def split_document_job(request)
        begin
        data, _status_code, _headers = split_document_job_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = split_document_job_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Splits a document into parts and saves them in the specified format.
    # @param request SplitDocumentJobRequest
    # @return [Array<(JobHandler, Fixnum, Hash)>]
    # JobHandler, response status code and response headers
    private def split_document_job_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? SplitDocumentJobRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.split_document_job ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'JobInfo')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#split_document_job\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [JobHandler.new(self, request.get_original_request, data), status_code, headers]
    end

    # Splits a document into parts and saves them in the specified format.
    # @param request SplitDocumentOnlineRequest
    # @return [SplitDocumentOnlineResponse]
    def split_document_online(request)
        begin
        data, _status_code, _headers = split_document_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = split_document_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Splits a document into parts and saves them in the specified format.
    # @param request SplitDocumentOnlineRequest
    # @return [Array<(SplitDocumentOnlineResponse, Fixnum, Hash)>]
    # SplitDocumentOnlineResponse, response status code and response headers
    private def split_document_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? SplitDocumentOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.split_document_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'SplitDocumentOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#split_document_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = SplitDocumentOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'SplitDocumentResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Splits a document into parts and saves them in the specified format.
    # @param request SplitDocumentOnlineJobRequest
    # @return [JobHandler]
    def split_document_online_job(request)
        begin
        data, _status_code, _headers = split_document_online_job_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = split_document_online_job_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Splits a document into parts and saves them in the specified format.
    # @param request SplitDocumentOnlineJobRequest
    # @return [Array<(JobHandler, Fixnum, Hash)>]
    # JobHandler, response status code and response headers
    private def split_document_online_job_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? SplitDocumentOnlineJobRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.split_document_online_job ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'JobInfo')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#split_document_online_job\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [JobHandler.new(self, request.get_original_request, data), status_code, headers]
    end

    # Translate a node id to a node path.
    # @param request TranslateNodeIdRequest
    # @return [TranslateNodeIdResponse]
    def translate_node_id(request)
        begin
        data, _status_code, _headers = translate_node_id_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = translate_node_id_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Translate a node id to a node path.
    # @param request TranslateNodeIdRequest
    # @return [Array<(TranslateNodeIdResponse, Fixnum, Hash)>]
    # TranslateNodeIdResponse, response status code and response headers
    private def translate_node_id_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? TranslateNodeIdRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.translate_node_id ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'TranslateNodeIdResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#translate_node_id\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Translate a node id to a node path.
    # @param request TranslateNodeIdOnlineRequest
    # @return [TranslateNodeIdResponse]
    def translate_node_id_online(request)
        begin
        data, _status_code, _headers = translate_node_id_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = translate_node_id_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Translate a node id to a node path.
    # @param request TranslateNodeIdOnlineRequest
    # @return [Array<(TranslateNodeIdResponse, Fixnum, Hash)>]
    # TranslateNodeIdResponse, response status code and response headers
    private def translate_node_id_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? TranslateNodeIdOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.translate_node_id_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'TranslateNodeIdResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#translate_node_id_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes protection from the document.
    # @param request UnprotectDocumentRequest
    # @return [ProtectionDataResponse]
    def unprotect_document(request)
        begin
        data, _status_code, _headers = unprotect_document_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = unprotect_document_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes protection from the document.
    # @param request UnprotectDocumentRequest
    # @return [Array<(ProtectionDataResponse, Fixnum, Hash)>]
    # ProtectionDataResponse, response status code and response headers
    private def unprotect_document_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UnprotectDocumentRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.unprotect_document ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'ProtectionDataResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#unprotect_document\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Removes protection from the document.
    # @param request UnprotectDocumentOnlineRequest
    # @return [UnprotectDocumentOnlineResponse]
    def unprotect_document_online(request)
        begin
        data, _status_code, _headers = unprotect_document_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = unprotect_document_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Removes protection from the document.
    # @param request UnprotectDocumentOnlineRequest
    # @return [Array<(UnprotectDocumentOnlineResponse, Fixnum, Hash)>]
    # UnprotectDocumentOnlineResponse, response status code and response headers
    private def unprotect_document_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UnprotectDocumentOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.unprotect_document_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'UnprotectDocumentOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#unprotect_document_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = UnprotectDocumentOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'ProtectionDataResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Updates a bookmark in the document.
    # @param request UpdateBookmarkRequest
    # @return [BookmarkResponse]
    def update_bookmark(request)
        begin
        data, _status_code, _headers = update_bookmark_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_bookmark_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates a bookmark in the document.
    # @param request UpdateBookmarkRequest
    # @return [Array<(BookmarkResponse, Fixnum, Hash)>]
    # BookmarkResponse, response status code and response headers
    private def update_bookmark_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateBookmarkRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_bookmark ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'BookmarkResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_bookmark\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Updates a bookmark in the document.
    # @param request UpdateBookmarkOnlineRequest
    # @return [UpdateBookmarkOnlineResponse]
    def update_bookmark_online(request)
        begin
        data, _status_code, _headers = update_bookmark_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_bookmark_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates a bookmark in the document.
    # @param request UpdateBookmarkOnlineRequest
    # @return [Array<(UpdateBookmarkOnlineResponse, Fixnum, Hash)>]
    # UpdateBookmarkOnlineResponse, response status code and response headers
    private def update_bookmark_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateBookmarkOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_bookmark_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'UpdateBookmarkOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_bookmark_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = UpdateBookmarkOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'BookmarkResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Updates a border in the document node.
    # The 'nodePath' parameter should refer to a paragraph, a cell or a row.
    # @param request UpdateBorderRequest
    # @return [BorderResponse]
    def update_border(request)
        begin
        data, _status_code, _headers = update_border_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_border_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates a border in the document node.
    # The 'nodePath' parameter should refer to a paragraph, a cell or a row.
    # @param request UpdateBorderRequest
    # @return [Array<(BorderResponse, Fixnum, Hash)>]
    # BorderResponse, response status code and response headers
    private def update_border_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateBorderRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_border ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'BorderResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_border\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Updates a border in the document node.
    # The 'nodePath' parameter should refer to a paragraph, a cell or a row.
    # @param request UpdateBorderOnlineRequest
    # @return [UpdateBorderOnlineResponse]
    def update_border_online(request)
        begin
        data, _status_code, _headers = update_border_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_border_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates a border in the document node.
    # The 'nodePath' parameter should refer to a paragraph, a cell or a row.
    # @param request UpdateBorderOnlineRequest
    # @return [Array<(UpdateBorderOnlineResponse, Fixnum, Hash)>]
    # UpdateBorderOnlineResponse, response status code and response headers
    private def update_border_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateBorderOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_border_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'UpdateBorderOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_border_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = UpdateBorderOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'BorderResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Updates a comment in the document.
    # @param request UpdateCommentRequest
    # @return [CommentResponse]
    def update_comment(request)
        begin
        data, _status_code, _headers = update_comment_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_comment_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates a comment in the document.
    # @param request UpdateCommentRequest
    # @return [Array<(CommentResponse, Fixnum, Hash)>]
    # CommentResponse, response status code and response headers
    private def update_comment_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateCommentRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_comment ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'CommentResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_comment\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Updates a comment in the document.
    # @param request UpdateCommentOnlineRequest
    # @return [UpdateCommentOnlineResponse]
    def update_comment_online(request)
        begin
        data, _status_code, _headers = update_comment_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_comment_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates a comment in the document.
    # @param request UpdateCommentOnlineRequest
    # @return [Array<(UpdateCommentOnlineResponse, Fixnum, Hash)>]
    # UpdateCommentOnlineResponse, response status code and response headers
    private def update_comment_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateCommentOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_comment_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'UpdateCommentOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_comment_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = UpdateCommentOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'CommentResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Updates the custom xml part in the document.
    # @param request UpdateCustomXmlPartRequest
    # @return [CustomXmlPartResponse]
    def update_custom_xml_part(request)
        begin
        data, _status_code, _headers = update_custom_xml_part_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_custom_xml_part_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates the custom xml part in the document.
    # @param request UpdateCustomXmlPartRequest
    # @return [Array<(CustomXmlPartResponse, Fixnum, Hash)>]
    # CustomXmlPartResponse, response status code and response headers
    private def update_custom_xml_part_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateCustomXmlPartRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_custom_xml_part ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'CustomXmlPartResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_custom_xml_part\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Updates the custom xml part in the document.
    # @param request UpdateCustomXmlPartOnlineRequest
    # @return [UpdateCustomXmlPartOnlineResponse]
    def update_custom_xml_part_online(request)
        begin
        data, _status_code, _headers = update_custom_xml_part_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_custom_xml_part_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates the custom xml part in the document.
    # @param request UpdateCustomXmlPartOnlineRequest
    # @return [Array<(UpdateCustomXmlPartOnlineResponse, Fixnum, Hash)>]
    # UpdateCustomXmlPartOnlineResponse, response status code and response headers
    private def update_custom_xml_part_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateCustomXmlPartOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_custom_xml_part_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'UpdateCustomXmlPartOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_custom_xml_part_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = UpdateCustomXmlPartOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'CustomXmlPartResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Updates a DrawingObject in the document node.
    # @param request UpdateDrawingObjectRequest
    # @return [DrawingObjectResponse]
    def update_drawing_object(request)
        begin
        data, _status_code, _headers = update_drawing_object_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_drawing_object_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates a DrawingObject in the document node.
    # @param request UpdateDrawingObjectRequest
    # @return [Array<(DrawingObjectResponse, Fixnum, Hash)>]
    # DrawingObjectResponse, response status code and response headers
    private def update_drawing_object_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateDrawingObjectRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_drawing_object ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'DrawingObjectResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_drawing_object\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Updates a DrawingObject in the document node.
    # @param request UpdateDrawingObjectOnlineRequest
    # @return [UpdateDrawingObjectOnlineResponse]
    def update_drawing_object_online(request)
        begin
        data, _status_code, _headers = update_drawing_object_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_drawing_object_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates a DrawingObject in the document node.
    # @param request UpdateDrawingObjectOnlineRequest
    # @return [Array<(UpdateDrawingObjectOnlineResponse, Fixnum, Hash)>]
    # UpdateDrawingObjectOnlineResponse, response status code and response headers
    private def update_drawing_object_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateDrawingObjectOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_drawing_object_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'UpdateDrawingObjectOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_drawing_object_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = UpdateDrawingObjectOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'DrawingObjectResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Updates a field in the document node.
    # @param request UpdateFieldRequest
    # @return [FieldResponse]
    def update_field(request)
        begin
        data, _status_code, _headers = update_field_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_field_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates a field in the document node.
    # @param request UpdateFieldRequest
    # @return [Array<(FieldResponse, Fixnum, Hash)>]
    # FieldResponse, response status code and response headers
    private def update_field_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateFieldRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_field ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FieldResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_field\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Updates a field in the document node.
    # @param request UpdateFieldOnlineRequest
    # @return [UpdateFieldOnlineResponse]
    def update_field_online(request)
        begin
        data, _status_code, _headers = update_field_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_field_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates a field in the document node.
    # @param request UpdateFieldOnlineRequest
    # @return [Array<(UpdateFieldOnlineResponse, Fixnum, Hash)>]
    # UpdateFieldOnlineResponse, response status code and response headers
    private def update_field_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateFieldOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_field_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'UpdateFieldOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_field_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = UpdateFieldOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'FieldResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Reevaluates field values in the document.
    # @param request UpdateFieldsRequest
    # @return [DocumentResponse]
    def update_fields(request)
        begin
        data, _status_code, _headers = update_fields_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_fields_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reevaluates field values in the document.
    # @param request UpdateFieldsRequest
    # @return [Array<(DocumentResponse, Fixnum, Hash)>]
    # DocumentResponse, response status code and response headers
    private def update_fields_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateFieldsRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_fields ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'DocumentResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_fields\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Reevaluates field values in the document.
    # @param request UpdateFieldsOnlineRequest
    # @return [UpdateFieldsOnlineResponse]
    def update_fields_online(request)
        begin
        data, _status_code, _headers = update_fields_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_fields_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Reevaluates field values in the document.
    # @param request UpdateFieldsOnlineRequest
    # @return [Array<(UpdateFieldsOnlineResponse, Fixnum, Hash)>]
    # UpdateFieldsOnlineResponse, response status code and response headers
    private def update_fields_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateFieldsOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_fields_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'UpdateFieldsOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_fields_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = UpdateFieldsOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'DocumentResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Updates a footnote in the document node.
    # @param request UpdateFootnoteRequest
    # @return [FootnoteResponse]
    def update_footnote(request)
        begin
        data, _status_code, _headers = update_footnote_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_footnote_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates a footnote in the document node.
    # @param request UpdateFootnoteRequest
    # @return [Array<(FootnoteResponse, Fixnum, Hash)>]
    # FootnoteResponse, response status code and response headers
    private def update_footnote_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateFootnoteRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_footnote ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FootnoteResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_footnote\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Updates a footnote in the document node.
    # @param request UpdateFootnoteOnlineRequest
    # @return [UpdateFootnoteOnlineResponse]
    def update_footnote_online(request)
        begin
        data, _status_code, _headers = update_footnote_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_footnote_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates a footnote in the document node.
    # @param request UpdateFootnoteOnlineRequest
    # @return [Array<(UpdateFootnoteOnlineResponse, Fixnum, Hash)>]
    # UpdateFootnoteOnlineResponse, response status code and response headers
    private def update_footnote_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateFootnoteOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_footnote_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'UpdateFootnoteOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_footnote_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = UpdateFootnoteOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'FootnoteResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Updates a form field in the document node.
    # @param request UpdateFormFieldRequest
    # @return [FormFieldResponse]
    def update_form_field(request)
        begin
        data, _status_code, _headers = update_form_field_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_form_field_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates a form field in the document node.
    # @param request UpdateFormFieldRequest
    # @return [Array<(FormFieldResponse, Fixnum, Hash)>]
    # FormFieldResponse, response status code and response headers
    private def update_form_field_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateFormFieldRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_form_field ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FormFieldResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_form_field\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Updates a form field in the document node.
    # @param request UpdateFormFieldOnlineRequest
    # @return [UpdateFormFieldOnlineResponse]
    def update_form_field_online(request)
        begin
        data, _status_code, _headers = update_form_field_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_form_field_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates a form field in the document node.
    # @param request UpdateFormFieldOnlineRequest
    # @return [Array<(UpdateFormFieldOnlineResponse, Fixnum, Hash)>]
    # UpdateFormFieldOnlineResponse, response status code and response headers
    private def update_form_field_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateFormFieldOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_form_field_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'UpdateFormFieldOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_form_field_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = UpdateFormFieldOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'FormFieldResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Updates a list in the document.
    # @param request UpdateListRequest
    # @return [ListResponse]
    def update_list(request)
        begin
        data, _status_code, _headers = update_list_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_list_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates a list in the document.
    # @param request UpdateListRequest
    # @return [Array<(ListResponse, Fixnum, Hash)>]
    # ListResponse, response status code and response headers
    private def update_list_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateListRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_list ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'ListResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_list\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Updates the level of a List element in the document.
    # @param request UpdateListLevelRequest
    # @return [ListResponse]
    def update_list_level(request)
        begin
        data, _status_code, _headers = update_list_level_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_list_level_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates the level of a List element in the document.
    # @param request UpdateListLevelRequest
    # @return [Array<(ListResponse, Fixnum, Hash)>]
    # ListResponse, response status code and response headers
    private def update_list_level_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateListLevelRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_list_level ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'ListResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_list_level\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Updates the level of a List element in the document.
    # @param request UpdateListLevelOnlineRequest
    # @return [UpdateListLevelOnlineResponse]
    def update_list_level_online(request)
        begin
        data, _status_code, _headers = update_list_level_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_list_level_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates the level of a List element in the document.
    # @param request UpdateListLevelOnlineRequest
    # @return [Array<(UpdateListLevelOnlineResponse, Fixnum, Hash)>]
    # UpdateListLevelOnlineResponse, response status code and response headers
    private def update_list_level_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateListLevelOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_list_level_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'UpdateListLevelOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_list_level_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = UpdateListLevelOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'ListResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Updates a list in the document.
    # @param request UpdateListOnlineRequest
    # @return [UpdateListOnlineResponse]
    def update_list_online(request)
        begin
        data, _status_code, _headers = update_list_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_list_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates a list in the document.
    # @param request UpdateListOnlineRequest
    # @return [Array<(UpdateListOnlineResponse, Fixnum, Hash)>]
    # UpdateListOnlineResponse, response status code and response headers
    private def update_list_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateListOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_list_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'UpdateListOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_list_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = UpdateListOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'ListResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Updates the formatting properties of a paragraph in the document node.
    # @param request UpdateParagraphFormatRequest
    # @return [ParagraphFormatResponse]
    def update_paragraph_format(request)
        begin
        data, _status_code, _headers = update_paragraph_format_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_paragraph_format_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates the formatting properties of a paragraph in the document node.
    # @param request UpdateParagraphFormatRequest
    # @return [Array<(ParagraphFormatResponse, Fixnum, Hash)>]
    # ParagraphFormatResponse, response status code and response headers
    private def update_paragraph_format_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateParagraphFormatRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_paragraph_format ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'ParagraphFormatResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_paragraph_format\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Updates the formatting properties of a paragraph in the document node.
    # @param request UpdateParagraphFormatOnlineRequest
    # @return [UpdateParagraphFormatOnlineResponse]
    def update_paragraph_format_online(request)
        begin
        data, _status_code, _headers = update_paragraph_format_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_paragraph_format_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates the formatting properties of a paragraph in the document node.
    # @param request UpdateParagraphFormatOnlineRequest
    # @return [Array<(UpdateParagraphFormatOnlineResponse, Fixnum, Hash)>]
    # UpdateParagraphFormatOnlineResponse, response status code and response headers
    private def update_paragraph_format_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateParagraphFormatOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_paragraph_format_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'UpdateParagraphFormatOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_paragraph_format_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = UpdateParagraphFormatOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'ParagraphFormatResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Updates the formatting properties of a paragraph list in the document node.
    # @param request UpdateParagraphListFormatRequest
    # @return [ParagraphListFormatResponse]
    def update_paragraph_list_format(request)
        begin
        data, _status_code, _headers = update_paragraph_list_format_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_paragraph_list_format_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates the formatting properties of a paragraph list in the document node.
    # @param request UpdateParagraphListFormatRequest
    # @return [Array<(ParagraphListFormatResponse, Fixnum, Hash)>]
    # ParagraphListFormatResponse, response status code and response headers
    private def update_paragraph_list_format_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateParagraphListFormatRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_paragraph_list_format ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'ParagraphListFormatResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_paragraph_list_format\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Updates the formatting properties of a paragraph list in the document node.
    # @param request UpdateParagraphListFormatOnlineRequest
    # @return [UpdateParagraphListFormatOnlineResponse]
    def update_paragraph_list_format_online(request)
        begin
        data, _status_code, _headers = update_paragraph_list_format_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_paragraph_list_format_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates the formatting properties of a paragraph list in the document node.
    # @param request UpdateParagraphListFormatOnlineRequest
    # @return [Array<(UpdateParagraphListFormatOnlineResponse, Fixnum, Hash)>]
    # UpdateParagraphListFormatOnlineResponse, response status code and response headers
    private def update_paragraph_list_format_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateParagraphListFormatOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_paragraph_list_format_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'UpdateParagraphListFormatOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_paragraph_list_format_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = UpdateParagraphListFormatOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'ParagraphListFormatResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Updates a Run object in the paragraph.
    # @param request UpdateRunRequest
    # @return [RunResponse]
    def update_run(request)
        begin
        data, _status_code, _headers = update_run_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_run_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates a Run object in the paragraph.
    # @param request UpdateRunRequest
    # @return [Array<(RunResponse, Fixnum, Hash)>]
    # RunResponse, response status code and response headers
    private def update_run_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateRunRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_run ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'RunResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_run\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Updates the font properties of a Run object in the paragraph.
    # @param request UpdateRunFontRequest
    # @return [FontResponse]
    def update_run_font(request)
        begin
        data, _status_code, _headers = update_run_font_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_run_font_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates the font properties of a Run object in the paragraph.
    # @param request UpdateRunFontRequest
    # @return [Array<(FontResponse, Fixnum, Hash)>]
    # FontResponse, response status code and response headers
    private def update_run_font_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateRunFontRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_run_font ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FontResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_run_font\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Updates the font properties of a Run object in the paragraph.
    # @param request UpdateRunFontOnlineRequest
    # @return [UpdateRunFontOnlineResponse]
    def update_run_font_online(request)
        begin
        data, _status_code, _headers = update_run_font_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_run_font_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates the font properties of a Run object in the paragraph.
    # @param request UpdateRunFontOnlineRequest
    # @return [Array<(UpdateRunFontOnlineResponse, Fixnum, Hash)>]
    # UpdateRunFontOnlineResponse, response status code and response headers
    private def update_run_font_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateRunFontOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_run_font_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'UpdateRunFontOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_run_font_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = UpdateRunFontOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'FontResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Updates a Run object in the paragraph.
    # @param request UpdateRunOnlineRequest
    # @return [UpdateRunOnlineResponse]
    def update_run_online(request)
        begin
        data, _status_code, _headers = update_run_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_run_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates a Run object in the paragraph.
    # @param request UpdateRunOnlineRequest
    # @return [Array<(UpdateRunOnlineResponse, Fixnum, Hash)>]
    # UpdateRunOnlineResponse, response status code and response headers
    private def update_run_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateRunOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_run_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'UpdateRunOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_run_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = UpdateRunOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'RunResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Updates the page setup of a section in the document.
    # @param request UpdateSectionPageSetupRequest
    # @return [SectionPageSetupResponse]
    def update_section_page_setup(request)
        begin
        data, _status_code, _headers = update_section_page_setup_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_section_page_setup_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates the page setup of a section in the document.
    # @param request UpdateSectionPageSetupRequest
    # @return [Array<(SectionPageSetupResponse, Fixnum, Hash)>]
    # SectionPageSetupResponse, response status code and response headers
    private def update_section_page_setup_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateSectionPageSetupRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_section_page_setup ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'SectionPageSetupResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_section_page_setup\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Updates the page setup of a section in the document.
    # @param request UpdateSectionPageSetupOnlineRequest
    # @return [UpdateSectionPageSetupOnlineResponse]
    def update_section_page_setup_online(request)
        begin
        data, _status_code, _headers = update_section_page_setup_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_section_page_setup_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates the page setup of a section in the document.
    # @param request UpdateSectionPageSetupOnlineRequest
    # @return [Array<(UpdateSectionPageSetupOnlineResponse, Fixnum, Hash)>]
    # UpdateSectionPageSetupOnlineResponse, response status code and response headers
    private def update_section_page_setup_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateSectionPageSetupOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_section_page_setup_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'UpdateSectionPageSetupOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_section_page_setup_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = UpdateSectionPageSetupOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'SectionPageSetupResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Updates a StructuredDocumentTag (SDT) in the document node.
    # @param request UpdateStructuredDocumentTagRequest
    # @return [StructuredDocumentTagResponse]
    def update_structured_document_tag(request)
        begin
        data, _status_code, _headers = update_structured_document_tag_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_structured_document_tag_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates a StructuredDocumentTag (SDT) in the document node.
    # @param request UpdateStructuredDocumentTagRequest
    # @return [Array<(StructuredDocumentTagResponse, Fixnum, Hash)>]
    # StructuredDocumentTagResponse, response status code and response headers
    private def update_structured_document_tag_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateStructuredDocumentTagRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_structured_document_tag ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'StructuredDocumentTagResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_structured_document_tag\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Updates a StructuredDocumentTag (SDT) in the document node.
    # @param request UpdateStructuredDocumentTagOnlineRequest
    # @return [UpdateStructuredDocumentTagOnlineResponse]
    def update_structured_document_tag_online(request)
        begin
        data, _status_code, _headers = update_structured_document_tag_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_structured_document_tag_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates a StructuredDocumentTag (SDT) in the document node.
    # @param request UpdateStructuredDocumentTagOnlineRequest
    # @return [Array<(UpdateStructuredDocumentTagOnlineResponse, Fixnum, Hash)>]
    # UpdateStructuredDocumentTagOnlineResponse, response status code and response headers
    private def update_structured_document_tag_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateStructuredDocumentTagOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_structured_document_tag_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'UpdateStructuredDocumentTagOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_structured_document_tag_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = UpdateStructuredDocumentTagOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'StructuredDocumentTagResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Updates a style in the document.
    # @param request UpdateStyleRequest
    # @return [StyleResponse]
    def update_style(request)
        begin
        data, _status_code, _headers = update_style_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_style_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates a style in the document.
    # @param request UpdateStyleRequest
    # @return [Array<(StyleResponse, Fixnum, Hash)>]
    # StyleResponse, response status code and response headers
    private def update_style_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateStyleRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_style ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'StyleResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_style\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Updates a style in the document.
    # @param request UpdateStyleOnlineRequest
    # @return [UpdateStyleOnlineResponse]
    def update_style_online(request)
        begin
        data, _status_code, _headers = update_style_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_style_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates a style in the document.
    # @param request UpdateStyleOnlineRequest
    # @return [Array<(UpdateStyleOnlineResponse, Fixnum, Hash)>]
    # UpdateStyleOnlineResponse, response status code and response headers
    private def update_style_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateStyleOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_style_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'UpdateStyleOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_style_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = UpdateStyleOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'StyleResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Updates the formatting properties of a cell in the table row.
    # @param request UpdateTableCellFormatRequest
    # @return [TableCellFormatResponse]
    def update_table_cell_format(request)
        begin
        data, _status_code, _headers = update_table_cell_format_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_table_cell_format_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates the formatting properties of a cell in the table row.
    # @param request UpdateTableCellFormatRequest
    # @return [Array<(TableCellFormatResponse, Fixnum, Hash)>]
    # TableCellFormatResponse, response status code and response headers
    private def update_table_cell_format_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateTableCellFormatRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_table_cell_format ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'TableCellFormatResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_table_cell_format\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Updates the formatting properties of a cell in the table row.
    # @param request UpdateTableCellFormatOnlineRequest
    # @return [UpdateTableCellFormatOnlineResponse]
    def update_table_cell_format_online(request)
        begin
        data, _status_code, _headers = update_table_cell_format_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_table_cell_format_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates the formatting properties of a cell in the table row.
    # @param request UpdateTableCellFormatOnlineRequest
    # @return [Array<(UpdateTableCellFormatOnlineResponse, Fixnum, Hash)>]
    # UpdateTableCellFormatOnlineResponse, response status code and response headers
    private def update_table_cell_format_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateTableCellFormatOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_table_cell_format_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'UpdateTableCellFormatOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_table_cell_format_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = UpdateTableCellFormatOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'TableCellFormatResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Updates properties of a table in the document node.
    # @param request UpdateTablePropertiesRequest
    # @return [TablePropertiesResponse]
    def update_table_properties(request)
        begin
        data, _status_code, _headers = update_table_properties_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_table_properties_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates properties of a table in the document node.
    # @param request UpdateTablePropertiesRequest
    # @return [Array<(TablePropertiesResponse, Fixnum, Hash)>]
    # TablePropertiesResponse, response status code and response headers
    private def update_table_properties_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateTablePropertiesRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_table_properties ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'TablePropertiesResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_table_properties\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Updates properties of a table in the document node.
    # @param request UpdateTablePropertiesOnlineRequest
    # @return [UpdateTablePropertiesOnlineResponse]
    def update_table_properties_online(request)
        begin
        data, _status_code, _headers = update_table_properties_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_table_properties_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates properties of a table in the document node.
    # @param request UpdateTablePropertiesOnlineRequest
    # @return [Array<(UpdateTablePropertiesOnlineResponse, Fixnum, Hash)>]
    # UpdateTablePropertiesOnlineResponse, response status code and response headers
    private def update_table_properties_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateTablePropertiesOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_table_properties_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'UpdateTablePropertiesOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_table_properties_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = UpdateTablePropertiesOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'TablePropertiesResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Updates the formatting properties of a table row.
    # @param request UpdateTableRowFormatRequest
    # @return [TableRowFormatResponse]
    def update_table_row_format(request)
        begin
        data, _status_code, _headers = update_table_row_format_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_table_row_format_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates the formatting properties of a table row.
    # @param request UpdateTableRowFormatRequest
    # @return [Array<(TableRowFormatResponse, Fixnum, Hash)>]
    # TableRowFormatResponse, response status code and response headers
    private def update_table_row_format_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateTableRowFormatRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_table_row_format ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'TableRowFormatResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_table_row_format\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Updates the formatting properties of a table row.
    # @param request UpdateTableRowFormatOnlineRequest
    # @return [UpdateTableRowFormatOnlineResponse]
    def update_table_row_format_online(request)
        begin
        data, _status_code, _headers = update_table_row_format_online_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = update_table_row_format_online_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Updates the formatting properties of a table row.
    # @param request UpdateTableRowFormatOnlineRequest
    # @return [Array<(UpdateTableRowFormatOnlineResponse, Fixnum, Hash)>]
    # UpdateTableRowFormatOnlineResponse, response status code and response headers
    private def update_table_row_format_online_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdateTableRowFormatOnlineRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.update_table_row_format_online ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        multipart_response: true,
                                                        return_type: 'UpdateTableRowFormatOnlineResponse')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#update_table_row_format_online\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        mp_data = UpdateTableRowFormatOnlineResponse.new()
        mp_data.model = @api_client.deserialize(data['Model'][:data], data['Model'][:headers], 'TableRowFormatResponse')
        mp_data.document = @api_client.parse_files_collection(data['Document'][:data], data['Document'][:headers])
        [mp_data, status_code, headers]
    end

    # Upload file.
    # @param request UploadFileRequest
    # @return [FilesUploadResult]
    def upload_file(request)
        begin
        data, _status_code, _headers = upload_file_with_http_info(request)
        rescue ApiError => e
            if e.code == 401
            request_token
            data, _status_code, _headers = upload_file_with_http_info(request)
            else
            raise
            end
        end
        data
    end

    # Upload file.
    # @param request UploadFileRequest
    # @return [Array<(FilesUploadResult, Fixnum, Hash)>]
    # FilesUploadResult, response status code and response headers
    private def upload_file_with_http_info(request)
        raise ArgumentError, 'Incorrect request type' unless request.is_a? UploadFileRequest

        @api_client.config.logger.debug 'Calling API: WordsApi.upload_file ...' if @api_client.config.debugging
        request_data = request.create_http_request(@api_client)

        data, status_code, headers = @api_client.call_api(
                                                        request_data[:'method'],
                                                        request_data[:'path'],
                                                        header_params: request_data[:'header_params'],
                                                        query_params: request_data[:'query_params'],
                                                        body: request_data[:'body'],
                                                        return_type: 'FilesUploadResult')
        if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        WordsApi#upload_file\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        end

        [data, status_code, headers]
    end

    # Encrypt string.
    # @param data string
    # @return [string]
    def encrypt(data)
        if data.to_s.empty?
            return data
        end

        if @rsa_key == nil
            modulus = @api_client.config.modulus
            exponent = @api_client.config.exponent

            if (modulus == nil || modulus.to_s.empty?) || (exponent == nil || exponent.to_s.empty?)
                response = self.get_public_key GetPublicKeyRequest.new
                modulus = response.modulus
                exponent = response.exponent
            end

            @rsa_key = rsa = create_rsa_key(modulus, exponent)
        end

        Base64.encode64(@rsa_key.public_encrypt(data.to_s.force_encoding("utf-8")))
    end

     #
     # Helper method to convert first letter to downcase
     #
    private def downcase_first_letter(str)
      value = str[0].downcase + str[1..-1]
      value
    end

     #
     # Gets a request token from server
     #
    private def request_token
      config = @api_client.config
      request_url = "/v4.0/words/connect/token"
      post_data = "grant_type=client_credentials" + "&client_id=" + config.client_data['ClientId'] + "&client_secret=" + config.client_data['ClientSecret']
      data, status_code, header = @api_client.call_api(:POST, request_url, :body => post_data, :return_type => 'Object',  :header_params => {'Content-Type': 'application/x-www-form-urlencoded'})
      @api_client.config.access_token = data[:access_token]
    end

    # requires all files inside a directory from current dir
    # @param _dir can be relative path like '/lib' or "../lib"
    private def require_all(_dir)
      Dir[File.expand_path(File.join(File.dirname(File.absolute_path(__FILE__)), _dir)) + "/*.rb"].each do |file|
        require file
      end
    end

    private def create_rsa_key(n, e)
      data_sequence = OpenSSL::ASN1::Sequence([
                                                OpenSSL::ASN1::Integer(base64_to_long(n)),
                                                OpenSSL::ASN1::Integer(base64_to_long(e))
                                              ])
      asn1 = OpenSSL::ASN1::Sequence(data_sequence)
      OpenSSL::PKey::RSA.new(asn1.to_der)
    end

    private def base64_to_long(data)
      decoded_with_padding = Base64.urlsafe_decode64(data) + Base64.decode64("==")
      decoded_with_padding.to_s.unpack("C*").map do |byte|
        byte_to_hex(byte)
      end.join.to_i(16)
    end

    private def byte_to_hex(int)
      int < 16 ? "0" + int.to_s(16) : int.to_s(16)
    end
  end
end
