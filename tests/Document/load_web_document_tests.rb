# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="LoadWebDocument_tests.rb">
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
  # Example of how to load web document.
  #
  class LoadWebDocumentTests < BaseTestContext
    #
    # Test for loading web document.
    #
    def test_load_web_document
      request_data_save_options = DocSaveOptionsData.new({:FileName => 'google.doc', :DmlEffectsRenderingMode => 'None', :DmlRenderingMode => 'DrawingML', :ZipOutput => false})
      request_data = LoadWebDocumentData.new({:LoadingDocumentUrl => 'http://google.com', :SaveOptions => request_data_save_options})
      request = LoadWebDocumentRequest.new(data: request_data)

       result = @words_api.load_web_document(request)
       assert_equal false, result.nil?
    end

    #
    # Test for loading web document online.
    #
    def test_load_web_document_online
      request_data_save_options = DocSaveOptionsData.new({:FileName => 'google.doc', :DmlEffectsRenderingMode => 'None', :DmlRenderingMode => 'DrawingML', :ZipOutput => false})
      request_data = LoadWebDocumentData.new({:LoadingDocumentUrl => 'http://google.com', :SaveOptions => request_data_save_options})
      request = LoadWebDocumentOnlineRequest.new(data: request_data)

       result = @words_api.load_web_document_online(request)
       assert_equal false, result.nil?
    end
  end
end