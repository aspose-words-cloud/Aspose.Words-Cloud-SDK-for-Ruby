# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="DocumentWithFormat_tests.rb">
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
  # Example of how to get document with different format.
  #
  class DocumentWithFormatTests < BaseTestContext
    def remote_data_folder
      remote_test_folder + '/DocumentActions/DocumentWithFormat'
    end

    def local_file
      'Common/test_multi_pages.docx'
    end


    #
    # Test for getting document with specified format.
    #
    def test_get_document_with_format
      remote_file_name = 'TestGetDocumentWithFormat.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetDocumentWithFormatRequest.new(name: remote_file_name, format: 'text', folder: remote_data_folder)

       result = @words_api.get_document_with_format(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting document with specified format.
    #
    def test_get_document_with_format_and_out_path
      remote_file_name = 'TestGetDocumentWithFormat.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetDocumentWithFormatRequest.new(name: remote_file_name, format: 'text', folder: remote_data_folder, out_path: remote_test_out + '/TestGetDocumentWithFormatAndOutPath.text')

       result = @words_api.get_document_with_format(request)
       assert_equal false, result.nil?
    end
  end
end