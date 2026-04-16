# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="Styles_tests.rb">
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
  # Example of how to work with styles.
  #
  class StylesTests < BaseTestContext
    def remote_data_folder
      remote_test_folder + '/DocumentElements/Styles'
    end

    def local_file
      'DocumentElements/Styles/GetStyles.docx'
    end


    #
    # Test for getting styles from document.
    #
    def test_get_styles
      remote_file_name = 'TestGetStyles.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetStylesRequest.new(name: remote_file_name, folder: remote_data_folder)

       result = @words_api.get_styles(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting styles from document online.
    #
    def test_get_styles_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetStylesOnlineRequest.new(document: request_document)

       result = @words_api.get_styles_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting style from document.
    #
    def test_get_style
      remote_file_name = 'TestGetStyle.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetStyleRequest.new(name: remote_file_name, style_name: 'Heading 1', folder: remote_data_folder)

       result = @words_api.get_style(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting style from document online.
    #
    def test_get_style_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetStyleOnlineRequest.new(document: request_document, style_name: 'Heading 1')

       result = @words_api.get_style_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating style from document.
    #
    def test_update_style
      remote_file_name = 'TestUpdateStyle.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_style_update = StyleUpdate.new({:Name => 'My Style'})
      request = UpdateStyleRequest.new(name: remote_file_name, style_name: 'Heading 1', style_update: request_style_update, folder: remote_data_folder)

       result = @words_api.update_style(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating style from document online.
    #
    def test_update_style_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_style_update = StyleUpdate.new({:Name => 'My Style'})
      request = UpdateStyleOnlineRequest.new(document: request_document, style_name: 'Heading 1', style_update: request_style_update)

       result = @words_api.update_style_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for inserting style from document.
    #
    def test_insert_style
      remote_file_name = 'TestInsertStyle.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_style_insert = StyleInsert.new({:StyleName => 'My Style', :StyleType => 'Paragraph'})
      request = InsertStyleRequest.new(name: remote_file_name, style_insert: request_style_insert, folder: remote_data_folder)

       result = @words_api.insert_style(request)
       assert_equal false, result.nil?
    end

    #
    # Test for inserting style from document online.
    #
    def test_insert_style_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_style_insert = StyleInsert.new({:StyleName => 'My Style', :StyleType => 'Paragraph'})
      request = InsertStyleOnlineRequest.new(document: request_document, style_insert: request_style_insert)

       result = @words_api.insert_style_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for coping style from document.
    #
    def test_copy_style
      remote_file_name = 'TestCopyStyle.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_style_copy = StyleCopy.new({:StyleName => 'Heading 1'})
      request = CopyStyleRequest.new(name: remote_file_name, style_copy: request_style_copy, folder: remote_data_folder)

       result = @words_api.copy_style(request)
       assert_equal false, result.nil?
    end

    #
    # Test for coping style from document online.
    #
    def test_copy_style_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_style_copy = StyleCopy.new({:StyleName => 'Heading 1'})
      request = CopyStyleOnlineRequest.new(document: request_document, style_copy: request_style_copy)

       result = @words_api.copy_style_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting style from document element.
    #
    def test_get_style_from_document_element
      remote_file_name = 'TestGetStyleFromDocumentElement.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetStyleFromDocumentElementRequest.new(name: remote_file_name, styled_node_path: 'paragraphs/1/paragraphFormat', folder: remote_data_folder)

       result = @words_api.get_style_from_document_element(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting style from document element online.
    #
    def test_get_style_from_document_element_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetStyleFromDocumentElementOnlineRequest.new(document: request_document, styled_node_path: 'paragraphs/1/paragraphFormat')

       result = @words_api.get_style_from_document_element_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for applying style to document element.
    #
    def test_apply_style_to_document_element
      remote_file_name = 'TestApplyStyleToDocumentElement.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_style_apply = StyleApply.new({:StyleName => 'Heading 1'})
      request = ApplyStyleToDocumentElementRequest.new(name: remote_file_name, styled_node_path: 'paragraphs/1/paragraphFormat', style_apply: request_style_apply, folder: remote_data_folder)

       result = @words_api.apply_style_to_document_element(request)
       assert_equal false, result.nil?
    end

    #
    # Test for applying style to document element online.
    #
    def test_apply_style_to_document_element_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_style_apply = StyleApply.new({:StyleName => 'Heading 1'})
      request = ApplyStyleToDocumentElementOnlineRequest.new(document: request_document, styled_node_path: 'paragraphs/1/paragraphFormat', style_apply: request_style_apply)

       result = @words_api.apply_style_to_document_element_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for copying styles from a template.
    #
    def test_copy_styles_from_template
      remote_file_name = 'TestCopyStylesFromTemplate.docx'
      template_folder = 'DocumentElements/Styles'
      template_name = 'StyleTemplate.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name
      upload_file File.join(local_test_folder, template_folder + '/' + template_name), remote_data_folder + '/' + template_name

      request = CopyStylesFromTemplateRequest.new(name: remote_file_name, template_name: template_name, folder: remote_data_folder)

       result = @words_api.copy_styles_from_template(request)
       assert_equal false, result.nil?
    end
  end
end