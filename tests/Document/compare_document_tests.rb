# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="CompareDocument_tests.rb">
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
  # Example of document comparison.
  #
  class CompareDocumentTests < BaseTestContext
    def remote_folder
      remote_test_folder + '/DocumentActions/CompareDocument'
    end

    def local_folder
      'DocumentActions/CompareDocument'
    end


    #
    # Test for document comparison.
    #
    def test_compare_document
      local_name1 = 'compareTestDoc1.doc'
      local_name2 = 'compareTestDoc2.doc'
      remote_name1 = 'TestCompareDocument1.doc'
      remote_name2 = 'TestCompareDocument2.doc'

      upload_file File.join(local_test_folder, local_folder + '/' + local_name1), remote_folder + '/' + remote_name1
      upload_file File.join(local_test_folder, local_folder + '/' + local_name2), remote_folder + '/' + remote_name2

      request_compare_data_file_reference = AsposeWordsCloud::FileReference.fromRemoteFilePath(remote_folder + '/' + remote_name2)
      request_compare_data = CompareData.new({:Author => 'author', :DateTime => Date.iso8601('2015-10-26T00:00:00.0000000Z'), :FileReference => request_compare_data_file_reference})
      request = CompareDocumentRequest.new(name: remote_name1, compare_data: request_compare_data, folder: remote_folder, dest_file_name: remote_test_out + '/TestCompareDocumentOut.doc')

       result = @words_api.compare_document(request)
       assert_equal false, result.nil?
    end

    #
    # Test for document comparison online.
    #
    def test_compare_document_online
      local_name1 = 'compareTestDoc1.doc'
      local_name2 = 'compareTestDoc2.doc'
      remote_name2 = 'TestCompareDocument2.doc'

      upload_file File.join(local_test_folder, local_folder + '/' + local_name2), remote_folder + '/' + remote_name2

      request_document = File.open(File.join(local_test_folder, local_folder + '/' + local_name1))
      request_compare_data_file_reference = AsposeWordsCloud::FileReference.fromRemoteFilePath(remote_folder + '/' + remote_name2)
      request_compare_data = CompareData.new({:Author => 'author', :DateTime => Date.iso8601('2015-10-26T00:00:00.0000000Z'), :FileReference => request_compare_data_file_reference})
      request = CompareDocumentOnlineRequest.new(document: request_document, compare_data: request_compare_data, dest_file_name: remote_test_out + '/TestCompareDocumentOut.doc')

       result = @words_api.compare_document_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for document comparison online.
    #
    def test_compare_two_document_online
      local_name1 = 'compareTestDoc1.doc'
      local_name2 = 'compareTestDoc2.doc'
      remote_name2 = 'TestCompareDocument2.doc'

      upload_file File.join(local_test_folder, local_folder + '/' + local_name2), remote_folder + '/' + remote_name2

      request_document = File.open(File.join(local_test_folder, local_folder + '/' + local_name1))
      request_compare_data_file_referenceStream = File.open(File.join(local_test_folder, local_folder + '/' + local_name2))
      request_compare_data_file_reference = AsposeWordsCloud::FileReference.fromLocalFileContent(request_compare_data_file_referenceStream)
      request_compare_data = CompareData.new({:Author => 'author', :DateTime => Date.iso8601('2015-10-26T00:00:00.0000000Z'), :FileReference => request_compare_data_file_reference})
      request = CompareDocumentOnlineRequest.new(document: request_document, compare_data: request_compare_data, dest_file_name: remote_test_out + '/TestCompareDocumentOut.doc')

       result = @words_api.compare_document_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for document comparison with password protection.
    #
    def test_compare_document_with_password
      local_name = 'DocWithPassword.docx'
      remote_name1 = 'TestCompareDocument1.docx'
      remote_name2 = 'TestCompareDocument2.docx'

      upload_file File.join(local_test_folder, 'Common/' + local_name), remote_folder + '/' + remote_name1
      upload_file File.join(local_test_folder, 'Common/' + local_name), remote_folder + '/' + remote_name2

      request_compare_data_file_reference = AsposeWordsCloud::FileReference.fromRemoteFilePathWithPassword(remote_folder + '/' + remote_name2, '12345')
      request_compare_data = CompareData.new({:Author => 'author', :DateTime => Date.iso8601('2015-10-26T00:00:00.0000000Z'), :FileReference => request_compare_data_file_reference})
      request = CompareDocumentRequest.new(name: remote_name1, compare_data: request_compare_data, folder: remote_folder, password: '12345', dest_file_name: remote_test_out + '/TestCompareDocumentOut.docx')

       result = @words_api.compare_document(request)
       assert_equal false, result.nil?
    end
  end
end