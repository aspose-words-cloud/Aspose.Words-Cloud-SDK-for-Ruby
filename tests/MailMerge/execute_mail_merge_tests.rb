# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="ExecuteMailMerge_tests.rb">
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
  require_relative '../base_test_context'

  #
  # Example of how to perform mail merge.
  #
  class ExecuteMailMergeTests < BaseTestContext
    def remote_data_folder
      remote_test_folder + '/DocumentActions/MailMerge'
    end

    def mail_merge_folder
      'DocumentActions/MailMerge'
    end


    #
    # Test for executing mail merge online.
    #
    def test_execute_mail_merge_online
      local_document_file = 'SampleExecuteTemplate.docx'
      local_data_file = 'SampleExecuteTemplateData.txt'

      request_template = File.open(File.join(local_test_folder, mail_merge_folder + '/' + local_document_file))
      request_data = File.open(File.join(local_test_folder, mail_merge_folder + '/' + local_data_file))
      request = ExecuteMailMergeOnlineRequest.new(template: request_template, data: request_data, with_regions: true)

       result = @words_api.execute_mail_merge_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for executing mail merge online job.
    #
    def test_execute_mail_merge_online_job
      local_document_file = 'SampleExecuteTemplate.docx'
      local_data_file = 'SampleExecuteTemplateData.txt'

      request_template = File.open(File.join(local_test_folder, mail_merge_folder + '/' + local_document_file))
      request_data = File.open(File.join(local_test_folder, mail_merge_folder + '/' + local_data_file))
      request = ExecuteMailMergeOnlineJobRequest.new(template: request_template, data: request_data, with_regions: true)

      job_handler = @words_api.execute_mail_merge_online_job(request)
      assert_equal false, job_handler.nil?
    job_handler.wait_result
    end

    #
    # Test for executing mail merge.
    #
    def test_execute_mail_merge
      local_document_file = 'SampleExecuteTemplate.docx'
      remote_file_name = 'TestExecuteMailMerge.docx'
      local_data_file = File.read(File.join(local_test_folder, mail_merge_folder + '/SampleMailMergeTemplateData.txt'))

      upload_file File.join(local_test_folder, mail_merge_folder + '/' + local_document_file), remote_data_folder + '/' + remote_file_name

      request = ExecuteMailMergeRequest.new(name: remote_file_name, data: local_data_file, folder: remote_data_folder, with_regions: true, dest_file_name: remote_test_out + '/' + remote_file_name)

       result = @words_api.execute_mail_merge(request)
       assert_equal false, result.nil?
    end

    #
    # Test for executing mail merge job.
    #
    def test_execute_mail_merge_job
      local_document_file = 'SampleExecuteTemplate.docx'
      remote_file_name = 'TestExecuteMailMerge.docx'
      local_data_file = File.read(File.join(local_test_folder, mail_merge_folder + '/SampleMailMergeTemplateData.txt'))

      upload_file File.join(local_test_folder, mail_merge_folder + '/' + local_document_file), remote_data_folder + '/' + remote_file_name

      request = ExecuteMailMergeJobRequest.new(name: remote_file_name, data: local_data_file, folder: remote_data_folder, with_regions: true, dest_file_name: remote_test_out + '/' + remote_file_name)

      job_handler = @words_api.execute_mail_merge_job(request)
      assert_equal false, job_handler.nil?
      result = job_handler.wait_result
    end
  end
end