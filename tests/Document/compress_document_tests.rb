# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="CompressDocument_tests.rb">
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
  # Example of how to compress document for reduce document size.
  #
  class CompressDocumentTests < BaseTestContext
    def remote_folder
      remote_test_folder + '/DocumentActions/CompressDocument'
    end

    def local_folder
      'DocumentActions/CompressDocument'
    end


    #
    # Test for compression document.
    #
    def test_compress_document
      local_name = 'TestCompress.docx'
      remote_name = 'TestCompress.docx'

      upload_file File.join(local_test_folder, local_folder + '/' + local_name), remote_folder + '/' + remote_name

      request_compress_options = CompressOptions.new({})
      request = CompressDocumentRequest.new(name: remote_name, compress_options: request_compress_options, folder: remote_folder)

       result = @words_api.compress_document(request)
       assert_equal false, result.nil?
    end

    #
    # Test for compression document online.
    #
    def test_compress_document_online
      local_name = 'TestCompress.docx'

      request_document = File.open(File.join(local_test_folder, local_folder + '/' + local_name))
      request_compress_options = CompressOptions.new({})
      request = CompressDocumentOnlineRequest.new(document: request_document, compress_options: request_compress_options)

       result = @words_api.compress_document_online(request)
       assert_equal false, result.nil?
    end
  end
end