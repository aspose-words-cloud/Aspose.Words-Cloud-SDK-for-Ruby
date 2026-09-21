# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="CustomXmlParts_tests.rb">
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
  # Example of how to use custom xml parts in documents.
  #
  class CustomXmlPartsTests < BaseTestContext
    def remote_data_folder
      remote_test_folder + '/CustomXmlParts'
    end

    def local_file
      'DocumentElements/CustomXmlParts/MultipleCustomXmlParts.docx'
    end


    #
    # Test for getting custom xml part by specified index.
    #
    def test_get_custom_xml_part
      remote_file_name = 'TestGetCustomXmlPart.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetCustomXmlPartRequest.new(name: remote_file_name, custom_xml_part_index: 0, folder: remote_data_folder)

       result = @words_api.get_custom_xml_part(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting custom xml part by specified index online.
    #
    def test_get_custom_xml_part_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetCustomXmlPartOnlineRequest.new(document: request_document, custom_xml_part_index: 0)

       result = @words_api.get_custom_xml_part_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting all custom xml parts from document.
    #
    def test_get_custom_xml_parts
      remote_file_name = 'TestGetCustomXmlParts.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetCustomXmlPartsRequest.new(name: remote_file_name, folder: remote_data_folder)

       result = @words_api.get_custom_xml_parts(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting all custom xml parts from document online.
    #
    def test_get_custom_xml_parts_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetCustomXmlPartsOnlineRequest.new(document: request_document)

       result = @words_api.get_custom_xml_parts_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for adding custom xml part.
    #
    def test_insert_custom_xml_part
      remote_file_name = 'TestInsertCustomXmlPart.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_custom_xml_part = CustomXmlPartInsert.new({:Id => 'hello', :Data => '<data>Hello world</data>'})
      request = InsertCustomXmlPartRequest.new(name: remote_file_name, custom_xml_part: request_custom_xml_part, folder: remote_data_folder)

       result = @words_api.insert_custom_xml_part(request)
       assert_equal false, result.nil?
    end

    #
    # Test for adding custom xml part online.
    #
    def test_insert_custom_xml_part_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_custom_xml_part = CustomXmlPartInsert.new({:Id => 'hello', :Data => '<data>Hello world</data>'})
      request = InsertCustomXmlPartOnlineRequest.new(document: request_document, custom_xml_part: request_custom_xml_part)

       result = @words_api.insert_custom_xml_part_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating custom xml part.
    #
    def test_update_custom_xml_part
      remote_file_name = 'TestUpdateCustomXmlPart.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_custom_xml_part = CustomXmlPartUpdate.new({:Data => '<data>Hello world</data>'})
      request = UpdateCustomXmlPartRequest.new(name: remote_file_name, custom_xml_part_index: 0, custom_xml_part: request_custom_xml_part, folder: remote_data_folder)

       result = @words_api.update_custom_xml_part(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating custom xml part online.
    #
    def test_update_custom_xml_part_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_custom_xml_part = CustomXmlPartUpdate.new({:Data => '<data>Hello world</data>'})
      request = UpdateCustomXmlPartOnlineRequest.new(document: request_document, custom_xml_part_index: 0, custom_xml_part: request_custom_xml_part)

       result = @words_api.update_custom_xml_part_online(request)
       assert_equal false, result.nil?
    end

    #
    # A test for DeleteCustomXmlPart.
    #
    def test_delete_custom_xml_part
      remote_file_name = 'TestDeleteCustomXmlPart.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = DeleteCustomXmlPartRequest.new(name: remote_file_name, custom_xml_part_index: 0, folder: remote_data_folder, dest_file_name: remote_test_out + '/' + remote_file_name)

       @words_api.delete_custom_xml_part(request)
    end

    #
    # A test for DeleteCustomXmlPart online.
    #
    def test_delete_custom_xml_part_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = DeleteCustomXmlPartOnlineRequest.new(document: request_document, custom_xml_part_index: 0)

       result = @words_api.delete_custom_xml_part_online(request)
       assert_equal false, result.nil?
    end

    #
    # A test for DeleteCustomXmlParts.
    #
    def test_delete_custom_xml_parts
      remote_file_name = 'TestDeleteCustomXmlPart.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = DeleteCustomXmlPartsRequest.new(name: remote_file_name, folder: remote_data_folder, dest_file_name: remote_test_out + '/' + remote_file_name)

       @words_api.delete_custom_xml_parts(request)
    end

    #
    # A test for DeleteCustomXmlParts online.
    #
    def test_delete_custom_xml_parts_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = DeleteCustomXmlPartsOnlineRequest.new(document: request_document)

       result = @words_api.delete_custom_xml_parts_online(request)
       assert_equal false, result.nil?
    end
  end
end