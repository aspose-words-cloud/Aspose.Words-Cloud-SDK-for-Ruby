# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="job_handler.rb">
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
  class JobHandler
    attr_reader :result

    def initialize(api, request, info)
      @api = api
      @request = request
      @info = info
      @result = nil
    end

    def status
      @info.status || ''
    end

    def message
      @info.message || ''
    end

    def update
      raise ApiError.new(code: 400, message: 'Invalid job id.', response_headers: {}, response_body: '') if @info.job_id.nil?

      parts = @api.call_job_result(@info.job_id)
      if parts.length >= 1
        @info = @api.api_client.deserialize_job_info_part(parts[0])
        if parts.length >= 2 && succeeded?
          @result = @api.api_client.deserialize_http_response_part(@request, parts[1][:data])
        end
      end

      @result
    end

    def wait_result(update_interval = 3)
      while queued? || processing?
        sleep(update_interval)
        update
      end

      update if succeeded? && @result.nil?

      unless succeeded?
        raise ApiError.new(
          code: 400,
          message: "Job failed with status \"#{status}\" - \"#{message}\".",
          response_headers: {},
          response_body: ''
        )
      end

      @result
    end

    private

    def queued?
      status.casecmp('Queued').zero?
    end

    def processing?
      status.casecmp('Processing').zero?
    end

    def succeeded?
      status.casecmp('Succeded').zero? || status.casecmp('Succeeded').zero?
    end
  end
end