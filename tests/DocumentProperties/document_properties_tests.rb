# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="DocumentProperties_tests.rb">
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
  # Example of how to get document properties.
  #
  class DocumentPropertiesTests < BaseTestContext
    def remote_data_folder
      remote_test_folder + '/DocumentElements/DocumentProperties'
    end

    def local_file
      'Common/test_multi_pages.docx'
    end


    #
    # Test for getting document properties.
    #
    def test_get_document_properties
      remote_file_name = 'TestGetDocumentProperties.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetDocumentPropertiesRequest.new(name: remote_file_name, folder: remote_data_folder)

       result = @words_api.get_document_properties(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting document properties online.
    #
    def test_get_document_properties_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetDocumentPropertiesOnlineRequest.new(document: request_document)

       result = @words_api.get_document_properties_online(request)
       assert_equal false, result.nil?
    end

    #
    # A test for GetDocumentProperty.
    #
    def test_get_document_property
      remote_file_name = 'TestGetDocumentProperty.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetDocumentPropertyRequest.new(name: remote_file_name, property_name: 'Author', folder: remote_data_folder)

       result = @words_api.get_document_property(request)
       assert_equal false, result.nil?
    end

    #
    # A test for GetDocumentProperty online.
    #
    def test_get_document_property_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetDocumentPropertyOnlineRequest.new(document: request_document, property_name: 'Author')

       result = @words_api.get_document_property_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting document property.
    #
    def test_delete_document_property
      remote_file_name = 'TestDeleteDocumentProperty.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = DeleteDocumentPropertyRequest.new(name: remote_file_name, property_name: 'testProp', folder: remote_data_folder, dest_file_name: remote_test_out + '/' + remote_file_name)

       @words_api.delete_document_property(request)
    end

    #
    # Test for deleting document property online.
    #
    def test_delete_document_property_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = DeleteDocumentPropertyOnlineRequest.new(document: request_document, property_name: 'testProp')

       result = @words_api.delete_document_property_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating document property.
    #
    def test_update_document_property
      remote_file_name = 'TestUpdateDocumentProperty.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_property = DocumentPropertyCreateOrUpdate.new({:Value => 'Imran Anwar'})
      request = CreateOrUpdateDocumentPropertyRequest.new(name: remote_file_name, property_name: 'AsposeAuthor', property: request_property, folder: remote_data_folder, dest_file_name: remote_test_out + '/' + remote_file_name)

       result = @words_api.create_or_update_document_property(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating document property online.
    #
    def test_update_document_property_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_property = DocumentPropertyCreateOrUpdate.new({:Value => 'Imran Anwar'})
      request = CreateOrUpdateDocumentPropertyOnlineRequest.new(document: request_document, property_name: 'AsposeAuthor', property: request_property)

       result = @words_api.create_or_update_document_property_online(request)
       assert_equal false, result.nil?
    end
  end
end