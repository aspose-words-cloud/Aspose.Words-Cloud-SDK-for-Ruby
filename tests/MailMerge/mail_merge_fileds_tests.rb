# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="MailMergeFileds_tests.rb">
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
  # Example of how to work with merge fields.
  #
  class MailMergeFiledsTests < BaseTestContext
    def remote_data_folder
      remote_test_folder + '/DocumentActions/MailMerge'
    end

    def mail_merge_folder
      'DocumentActions/MailMerge'
    end


    #
    # Test for putting new fields.
    #
    def test_get_document_field_names_online
      local_document_file = 'SampleExecuteTemplate.docx'

      request_template = File.open(File.join(local_test_folder, mail_merge_folder + '/' + local_document_file))
      request = GetDocumentFieldNamesOnlineRequest.new(template: request_template, use_non_merge_fields: true)

       result = @words_api.get_document_field_names_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting mailmerge fields.
    #
    def test_get_document_field_names
      remote_file_name = 'TestGetDocumentFieldNames.docx'

      upload_file File.join(local_test_folder, 'Common/test_multi_pages.docx'), remote_data_folder + '/' + remote_file_name

      request = GetDocumentFieldNamesRequest.new(name: remote_file_name, folder: remote_data_folder)

       result = @words_api.get_document_field_names(request)
       assert_equal false, result.nil?
    end
  end
end