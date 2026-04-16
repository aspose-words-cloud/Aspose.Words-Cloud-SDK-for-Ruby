# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="DrawingObjects_tests.rb">
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
  # Example of how to get drawing objects.
  #
  class DrawingObjectsTests < BaseTestContext
    def remote_data_folder
      remote_test_folder + '/DocumentElements/DrawingObjectss'
    end

    def local_file
      'Common/test_multi_pages.docx'
    end

    def local_drawing_file
      'DocumentElements/DrawingObjects/sample_EmbeddedOLE.docx'
    end


    #
    # Test for getting drawing objects from document.
    #
    def test_get_document_drawing_objects
      remote_file_name = 'TestGetDocumentDrawingObjects.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetDocumentDrawingObjectsRequest.new(name: remote_file_name, node_path: 'sections/0', folder: remote_data_folder)

       result = @words_api.get_document_drawing_objects(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting drawing objects from document online.
    #
    def test_get_document_drawing_objects_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetDocumentDrawingObjectsOnlineRequest.new(document: request_document, node_path: 'sections/0')

       result = @words_api.get_document_drawing_objects_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting drawing objects from document without node path.
    #
    def test_get_document_drawing_objects_without_node_path
      remote_file_name = 'TestGetDocumentDrawingObjectsWithoutNodePath.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetDocumentDrawingObjectsRequest.new(name: remote_file_name, folder: remote_data_folder)

       result = @words_api.get_document_drawing_objects(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting drawing object by specified index.
    #
    def test_get_document_drawing_object_by_index
      remote_file_name = 'TestGetDocumentDrawingObjectByIndex.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetDocumentDrawingObjectByIndexRequest.new(name: remote_file_name, index: 0, node_path: 'sections/0', folder: remote_data_folder)

       result = @words_api.get_document_drawing_object_by_index(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting drawing object by specified index online.
    #
    def test_get_document_drawing_object_by_index_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetDocumentDrawingObjectByIndexOnlineRequest.new(document: request_document, index: 0, node_path: 'sections/0')

       result = @words_api.get_document_drawing_object_by_index_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting drawing object by specified index without node path.
    #
    def test_get_document_drawing_object_by_index_without_node_path
      remote_file_name = 'TestGetDocumentDrawingObjectByIndexWithoutNodePath.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetDocumentDrawingObjectByIndexRequest.new(name: remote_file_name, index: 0, folder: remote_data_folder)

       result = @words_api.get_document_drawing_object_by_index(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting drawing object by specified index and format.
    #
    def test_render_drawing_object
      remote_file_name = 'TestGetDocumentDrawingObjectByIndexWithFormat.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = RenderDrawingObjectRequest.new(name: remote_file_name, format: 'png', index: 0, node_path: 'sections/0', folder: remote_data_folder)

       result = @words_api.render_drawing_object(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting drawing object by specified index and format online.
    #
    def test_render_drawing_object_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = RenderDrawingObjectOnlineRequest.new(document: request_document, format: 'png', index: 0, node_path: 'sections/0')

       result = @words_api.render_drawing_object_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting drawing object by specified index and format without node path.
    #
    def test_render_drawing_object_without_node_path
      remote_file_name = 'TestGetDocumentDrawingObjectByIndexWithFormatWithoutNodePath.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = RenderDrawingObjectRequest.new(name: remote_file_name, format: 'png', index: 0, folder: remote_data_folder)

       result = @words_api.render_drawing_object(request)
       assert_equal false, result.nil?
    end

    #
    # Test for reading drawing object's image data.
    #
    def test_get_document_drawing_object_image_data
      remote_file_name = 'TestGetDocumentDrawingObjectImageData.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetDocumentDrawingObjectImageDataRequest.new(name: remote_file_name, index: 0, node_path: 'sections/0', folder: remote_data_folder)

       result = @words_api.get_document_drawing_object_image_data(request)
       assert_equal false, result.nil?
    end

    #
    # Test for reading drawing object's image data online.
    #
    def test_get_document_drawing_object_image_data_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetDocumentDrawingObjectImageDataOnlineRequest.new(document: request_document, index: 0, node_path: 'sections/0')

       result = @words_api.get_document_drawing_object_image_data_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for reading drawing object's image data without node path.
    #
    def test_get_document_drawing_object_image_data_without_node_path
      remote_file_name = 'TestGetDocumentDrawingObjectImageDataWithoutNodePath.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetDocumentDrawingObjectImageDataRequest.new(name: remote_file_name, index: 0, folder: remote_data_folder)

       result = @words_api.get_document_drawing_object_image_data(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting drawing object OLE data.
    #
    def test_get_document_drawing_object_ole_data
      remote_file_name = 'TestGetDocumentDrawingObjectOleData.docx'

      upload_file File.join(local_test_folder, local_drawing_file), remote_data_folder + '/' + remote_file_name

      request = GetDocumentDrawingObjectOleDataRequest.new(name: remote_file_name, index: 0, node_path: 'sections/0', folder: remote_data_folder)

       result = @words_api.get_document_drawing_object_ole_data(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting drawing object OLE data online.
    #
    def test_get_document_drawing_object_ole_data_online
      request_document = File.open(File.join(local_test_folder, local_drawing_file))
      request = GetDocumentDrawingObjectOleDataOnlineRequest.new(document: request_document, index: 0, node_path: 'sections/0')

       result = @words_api.get_document_drawing_object_ole_data_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting drawing object OLE data without node path.
    #
    def test_get_document_drawing_object_ole_data_without_node_path
      remote_file_name = 'TestGetDocumentDrawingObjectOleDataWithoutNodePath.docx'

      upload_file File.join(local_test_folder, local_drawing_file), remote_data_folder + '/' + remote_file_name

      request = GetDocumentDrawingObjectOleDataRequest.new(name: remote_file_name, index: 0, folder: remote_data_folder)

       result = @words_api.get_document_drawing_object_ole_data(request)
       assert_equal false, result.nil?
    end

    #
    # Test for adding drawing object.
    #
    def test_insert_drawing_object
      remote_file_name = 'TestInsetDrawingObject.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_drawing_object = DrawingObjectInsert.new({:Height => 0, :Left => 0, :Top => 0, :Width => 0, :RelativeHorizontalPosition => 'Margin', :RelativeVerticalPosition => 'Margin', :WrapType => 'Inline'})
      request_image_file = File.open(File.join(local_test_folder, 'Common/aspose-cloud.png'))
      request = InsertDrawingObjectRequest.new(name: remote_file_name, drawing_object: request_drawing_object, image_file: request_image_file, node_path: '', folder: remote_data_folder)

       result = @words_api.insert_drawing_object(request)
       assert_equal false, result.nil?
    end

    #
    # Test for adding drawing object online.
    #
    def test_insert_drawing_object_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_drawing_object = DrawingObjectInsert.new({:Height => 0, :Left => 0, :Top => 0, :Width => 0, :RelativeHorizontalPosition => 'Margin', :RelativeVerticalPosition => 'Margin', :WrapType => 'Inline'})
      request_image_file = File.open(File.join(local_test_folder, 'Common/aspose-cloud.png'))
      request = InsertDrawingObjectOnlineRequest.new(document: request_document, drawing_object: request_drawing_object, image_file: request_image_file, node_path: '')

       result = @words_api.insert_drawing_object_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for adding drawing object without node path.
    #
    def test_insert_drawing_object_without_node_path
      remote_file_name = 'TestInsetDrawingObjectWithoutNodePath.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_drawing_object = DrawingObjectInsert.new({:Height => 0, :Left => 0, :Top => 0, :Width => 0, :RelativeHorizontalPosition => 'Margin', :RelativeVerticalPosition => 'Margin', :WrapType => 'Inline'})
      request_image_file = File.open(File.join(local_test_folder, 'Common/aspose-cloud.png'))
      request = InsertDrawingObjectRequest.new(name: remote_file_name, drawing_object: request_drawing_object, image_file: request_image_file, folder: remote_data_folder)

       result = @words_api.insert_drawing_object(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting drawing object.
    #
    def test_delete_drawing_object
      remote_file_name = 'TestDeleteDrawingObject.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = DeleteDrawingObjectRequest.new(name: remote_file_name, index: 0, node_path: '', folder: remote_data_folder)

       @words_api.delete_drawing_object(request)
    end

    #
    # Test for deleting drawing object online.
    #
    def test_delete_drawing_object_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = DeleteDrawingObjectOnlineRequest.new(document: request_document, index: 0, node_path: '')

       result = @words_api.delete_drawing_object_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting drawing object without node path.
    #
    def test_delete_drawing_object_without_node_path
      remote_file_name = 'TestDeleteDrawingObjectWithoutNodePath.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = DeleteDrawingObjectRequest.new(name: remote_file_name, index: 0, folder: remote_data_folder)

       @words_api.delete_drawing_object(request)
    end

    #
    # Test for updating drawing object.
    #
    def test_update_drawing_object
      remote_file_name = 'TestUpdateDrawingObject.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_drawing_object = DrawingObjectUpdate.new({:Left => 0})
      request_image_file = File.open(File.join(local_test_folder, 'Common/aspose-cloud.png'))
      request = UpdateDrawingObjectRequest.new(name: remote_file_name, drawing_object: request_drawing_object, image_file: request_image_file, index: 0, node_path: '', folder: remote_data_folder)

       result = @words_api.update_drawing_object(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating drawing object online.
    #
    def test_update_drawing_object_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_drawing_object = DrawingObjectUpdate.new({:Left => 0})
      request_image_file = File.open(File.join(local_test_folder, 'Common/aspose-cloud.png'))
      request = UpdateDrawingObjectOnlineRequest.new(document: request_document, drawing_object: request_drawing_object, image_file: request_image_file, index: 0, node_path: '')

       result = @words_api.update_drawing_object_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating drawing object without node path.
    #
    def test_update_drawing_object_without_node_path
      remote_file_name = 'TestUpdateDrawingObjectWithoutNodePath.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_drawing_object = DrawingObjectUpdate.new({:Left => 0})
      request_image_file = File.open(File.join(local_test_folder, 'Common/aspose-cloud.png'))
      request = UpdateDrawingObjectRequest.new(name: remote_file_name, drawing_object: request_drawing_object, image_file: request_image_file, index: 0, folder: remote_data_folder)

       result = @words_api.update_drawing_object(request)
       assert_equal false, result.nil?
    end
  end
end