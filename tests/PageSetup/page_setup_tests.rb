# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="PageSetup_tests.rb">
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
  class PageSetupTests < BaseTestContext
    def remote_data_folder
      remote_test_folder + '/DocumentElements/PageSetup'
    end

    def local_file
      'Common/test_multi_pages.docx'
    end

    def local_text_file
      'DocumentElements/Text/SampleWordDocument.docx'
    end


    #
    # Test for getting page settings.
    #
    def test_get_section_page_setup
      remote_file_name = 'TestGetSectionPageSetup.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetSectionPageSetupRequest.new(name: remote_file_name, section_index: 0, folder: remote_data_folder)

       result = @words_api.get_section_page_setup(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting page settings online.
    #
    def test_get_section_page_setup_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetSectionPageSetupOnlineRequest.new(document: request_document, section_index: 0)

       result = @words_api.get_section_page_setup_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating page settings.
    #
    def test_update_section_page_setup
      remote_file_name = 'TestUpdateSectionPageSetup.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_page_setup = PageSetup.new({:RtlGutter => true, :LeftMargin => 10.0, :Orientation => 'Landscape', :PaperSize => 'A5'})
      request = UpdateSectionPageSetupRequest.new(name: remote_file_name, section_index: 0, page_setup: request_page_setup, folder: remote_data_folder)

       result = @words_api.update_section_page_setup(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating page settings online.
    #
    def test_update_section_page_setup_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_page_setup = PageSetup.new({:RtlGutter => true, :LeftMargin => 10, :Orientation => 'Landscape', :PaperSize => 'A5'})
      request = UpdateSectionPageSetupOnlineRequest.new(document: request_document, section_index: 0, page_setup: request_page_setup)

       result = @words_api.update_section_page_setup_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for page rendering.
    #
    def test_get_render_page
      remote_file_name = 'TestGetRenderPage.docx'

      upload_file File.join(local_test_folder, local_text_file), remote_data_folder + '/' + remote_file_name

      request = RenderPageRequest.new(name: remote_file_name, page_index: 1, format: 'jpg', folder: remote_data_folder)

       result = @words_api.render_page(request)
       assert_equal false, result.nil?
    end

    #
    # Test for page rendering.
    #
    def test_get_render_page_online
      request_document = File.open(File.join(local_test_folder, local_text_file))
      request = RenderPageOnlineRequest.new(document: request_document, page_index: 1, format: 'jpg')

       result = @words_api.render_page_online(request)
       assert_equal false, result.nil?
    end
  end
end