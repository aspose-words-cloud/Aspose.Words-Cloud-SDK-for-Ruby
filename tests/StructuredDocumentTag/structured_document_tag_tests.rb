# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="StructuredDocumentTag_tests.rb">
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
  # Example of how to use structured document tags.
  #
  class StructuredDocumentTagTests < BaseTestContext
    def remote_data_folder
      remote_test_folder + '/DocumentElements/StructuredDocumentTag'
    end

    def local_file
      'DocumentElements/StructuredDocumentTag/StructuredDocumentTag.docx'
    end


    #
    # Test for getting SDT objects from document.
    #
    def test_get_structured_document_tags
      remote_file_name = 'TestGetStructuredDocumentTags.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetStructuredDocumentTagsRequest.new(name: remote_file_name, node_path: 'sections/0/body/paragraphs/0', folder: remote_data_folder)

       result = @words_api.get_structured_document_tags(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting SDT objects from document online.
    #
    def test_get_structured_document_tags_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetStructuredDocumentTagsOnlineRequest.new(document: request_document, node_path: 'sections/0/body/paragraphs/0')

       result = @words_api.get_structured_document_tags_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting SDT object from document.
    #
    def test_get_structured_document_tag
      remote_file_name = 'TestGetStructuredDocumentTag.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetStructuredDocumentTagRequest.new(name: remote_file_name, index: 0, node_path: 'sections/0/body/paragraphs/0', folder: remote_data_folder)

       result = @words_api.get_structured_document_tag(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting SDT object from document online.
    #
    def test_get_structured_document_tag_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetStructuredDocumentTagOnlineRequest.new(document: request_document, index: 0, node_path: 'sections/0/body/paragraphs/0')

       result = @words_api.get_structured_document_tag_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for adding SDT object.
    #
    def test_insert_structured_document_tag
      remote_file_name = 'TestInsetStructuredDocumentTag.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_structured_document_tag = StructuredDocumentTagInsert.new({:SdtType => 'ComboBox', :Level => 'Inline'})
      request = InsertStructuredDocumentTagRequest.new(name: remote_file_name, structured_document_tag: request_structured_document_tag, node_path: 'sections/0/body/paragraphs/0', folder: remote_data_folder)

       result = @words_api.insert_structured_document_tag(request)
       assert_equal false, result.nil?
    end

    #
    # Test for adding SDT object online.
    #
    def test_insert_structured_document_tag_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_structured_document_tag = StructuredDocumentTagInsert.new({:SdtType => 'ComboBox', :Level => 'Inline'})
      request = InsertStructuredDocumentTagOnlineRequest.new(document: request_document, structured_document_tag: request_structured_document_tag, node_path: 'sections/0/body/paragraphs/0')

       result = @words_api.insert_structured_document_tag_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting SDT object.
    #
    def test_delete_structured_document_tag
      remote_file_name = 'TestDeleteStructuredDocumentTag.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = DeleteStructuredDocumentTagRequest.new(name: remote_file_name, index: 0, node_path: 'sections/0/body/paragraphs/0', folder: remote_data_folder)

       @words_api.delete_structured_document_tag(request)
    end

    #
    # Test for deleting SDT object online.
    #
    def test_delete_structured_document_tag_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = DeleteStructuredDocumentTagOnlineRequest.new(document: request_document, index: 0, node_path: 'sections/0/body/paragraphs/0')

       result = @words_api.delete_structured_document_tag_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating SDT object.
    #
    def test_update_structured_document_tag
      remote_file_name = 'TestUpdateStructuredDocumentTag.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_structured_document_tag_list_items0 = StructuredDocumentTagListItem.new({:DisplayText => 'Aspose Words', :Value => '1'})
      request_structured_document_tag_list_items1 = StructuredDocumentTagListItem.new({:DisplayText => 'Hello world', :Value => '2'})
      request_structured_document_tag_list_items = [request_structured_document_tag_list_items0, request_structured_document_tag_list_items1]
      request_structured_document_tag = StructuredDocumentTagUpdate.new({:ListItems => request_structured_document_tag_list_items})
      request = UpdateStructuredDocumentTagRequest.new(name: remote_file_name, index: 0, structured_document_tag: request_structured_document_tag, node_path: 'sections/0/body/paragraphs/0', folder: remote_data_folder)

       result = @words_api.update_structured_document_tag(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating SDT object online.
    #
    def test_update_structured_document_tag_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_structured_document_tag_list_items0 = StructuredDocumentTagListItem.new({:DisplayText => 'Aspose Words', :Value => '1'})
      request_structured_document_tag_list_items1 = StructuredDocumentTagListItem.new({:DisplayText => 'Hello world', :Value => '2'})
      request_structured_document_tag_list_items = [request_structured_document_tag_list_items0, request_structured_document_tag_list_items1]
      request_structured_document_tag = StructuredDocumentTagUpdate.new({:ListItems => request_structured_document_tag_list_items})
      request = UpdateStructuredDocumentTagOnlineRequest.new(document: request_document, structured_document_tag: request_structured_document_tag, index: 0, node_path: 'sections/0/body/paragraphs/0')

       result = @words_api.update_structured_document_tag_online(request)
       assert_equal false, result.nil?
    end
  end
end