# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="MathObject_tests.rb">
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
  # Example of how to work with MathObjects.
  #
  class MathObjectTests < BaseTestContext
    def remote_data_folder
      remote_test_folder + '/DocumentElements/MathObjects'
    end

    def local_file
      'DocumentElements/MathObjects/MathObjects.docx'
    end


    #
    # Test for getting mathObjects.
    #
    def test_get_office_math_objects
      remote_file_name = 'TestGetOfficeMathObjects.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetOfficeMathObjectsRequest.new(name: remote_file_name, node_path: '', folder: remote_data_folder)

       result = @words_api.get_office_math_objects(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting mathObjects online.
    #
    def test_get_office_math_objects_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetOfficeMathObjectsOnlineRequest.new(document: request_document, node_path: '')

       result = @words_api.get_office_math_objects_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting mathObjects without node path.
    #
    def test_get_office_math_objects_without_node_path
      remote_file_name = 'TestGetOfficeMathObjectsWithoutNodePath.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetOfficeMathObjectsRequest.new(name: remote_file_name, folder: remote_data_folder)

       result = @words_api.get_office_math_objects(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting mathObject.
    #
    def test_get_office_math_object
      remote_file_name = 'TestGetOfficeMathObject.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetOfficeMathObjectRequest.new(name: remote_file_name, index: 0, node_path: '', folder: remote_data_folder)

       result = @words_api.get_office_math_object(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting mathObject online.
    #
    def test_get_office_math_object_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetOfficeMathObjectOnlineRequest.new(document: request_document, index: 0, node_path: '')

       result = @words_api.get_office_math_object_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting mathObject without node path.
    #
    def test_get_office_math_object_without_node_path
      remote_file_name = 'TestGetOfficeMathObjectWithoutNodePath.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetOfficeMathObjectRequest.new(name: remote_file_name, index: 0, folder: remote_data_folder)

       result = @words_api.get_office_math_object(request)
       assert_equal false, result.nil?
    end

    #
    # Test for rendering mathObject.
    #
    def test_render_math_object
      remote_file_name = 'TestRenderMathObject.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = RenderMathObjectRequest.new(name: remote_file_name, format: 'png', index: 0, node_path: '', folder: remote_data_folder)

       result = @words_api.render_math_object(request)
       assert_equal false, result.nil?
    end

    #
    # Test for rendering mathObject.
    #
    def test_render_math_object_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = RenderMathObjectOnlineRequest.new(document: request_document, format: 'png', index: 0, node_path: '')

       result = @words_api.render_math_object_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for rendering mathObject without node path.
    #
    def test_render_math_object_without_node_path
      remote_file_name = 'TestRenderMathObjectWithoutNodePath.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = RenderMathObjectRequest.new(name: remote_file_name, format: 'png', index: 0, folder: remote_data_folder)

       result = @words_api.render_math_object(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting mathObject.
    #
    def test_delete_office_math_object
      remote_file_name = 'TestDeleteOfficeMathObject.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = DeleteOfficeMathObjectRequest.new(name: remote_file_name, index: 0, node_path: '', folder: remote_data_folder)

       @words_api.delete_office_math_object(request)
    end

    #
    # Test for deleting mathObject online.
    #
    def test_delete_office_math_object_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = DeleteOfficeMathObjectOnlineRequest.new(document: request_document, index: 0, node_path: '')

       result = @words_api.delete_office_math_object_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting mathObject without node path.
    #
    def test_delete_office_math_object_without_node_path
      remote_file_name = 'TestDeleteOfficeMathObjectWithoutNodePath.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = DeleteOfficeMathObjectRequest.new(name: remote_file_name, index: 0, folder: remote_data_folder)

       @words_api.delete_office_math_object(request)
    end

    #
    # Test for deleting math objects.
    #
    def test_delete_office_math_objects
      remote_file_name = 'TestDeleteOfficeMathObject.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = DeleteOfficeMathObjectsRequest.new(name: remote_file_name, folder: remote_data_folder)

       @words_api.delete_office_math_objects(request)
    end

    #
    # Test for deleting math objects online.
    #
    def test_delete_office_math_objects_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = DeleteOfficeMathObjectsOnlineRequest.new(document: request_document)

       result = @words_api.delete_office_math_objects_online(request)
       assert_equal false, result.nil?
    end
  end
end