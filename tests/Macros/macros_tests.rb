# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="Macros_tests.rb">
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
  # Example of how to work with macros.
  #
  class MacrosTests < BaseTestContext
    def remote_data_folder
      remote_test_folder + '/DocumentElements/Macros'
    end

    def local_file
      'Common/test_multi_pages.docx'
    end


    #
    # Test for deleting macros.
    #
    def test_delete_macros
      remote_file_name = 'TestDeleteDocumentMacros.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = DeleteMacrosRequest.new(name: remote_file_name, folder: remote_data_folder)

       @words_api.delete_macros(request)
    end

    #
    # Test for deleting macros online.
    #
    def test_delete_macros_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = DeleteMacrosOnlineRequest.new(document: request_document)

       result = @words_api.delete_macros_online(request)
       assert_equal false, result.nil?
    end
  end
end