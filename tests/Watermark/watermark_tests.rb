# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="Watermark_tests.rb">
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
  # Example of how to work with watermarks.
  #
  class WatermarkTests < BaseTestContext
    def remote_data_folder
      remote_test_folder + '/DocumentActions/Watermark'
    end

    def local_file
      'Common/test_multi_pages.docx'
    end


    #
    # Test for adding watermark text.
    #
    def test_insert_watermark_text
      remote_file_name = 'TestInsertWatermarkText.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_watermark_data = WatermarkDataText.new({:Text => 'watermark text'})
      request = InsertWatermarkRequest.new(name: remote_file_name, watermark_data: request_watermark_data, folder: remote_data_folder, dest_file_name: remote_test_out + '/' + remote_file_name)

       result = @words_api.insert_watermark(request)
       assert_equal false, result.nil?
    end

    #
    # Test for adding watermark text online.
    #
    def test_insert_watermark_text_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_watermark_data = WatermarkDataText.new({:Text => 'watermark text'})
      request = InsertWatermarkOnlineRequest.new(document: request_document, watermark_data: request_watermark_data)

       result = @words_api.insert_watermark_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for adding watermark text.
    #
    def test_insert_watermark_image
      remote_file_name = 'TestInsertWatermarkImage.docx'
      remote_image_path = remote_data_folder + '/TestInsertWatermarkImage.png'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name
      upload_file File.join(local_test_folder, 'Common/aspose-cloud.png'), remote_image_path

      request_watermark_data_image = AsposeWordsCloud::FileReference.fromRemoteFilePath(remote_image_path)
      request_watermark_data = WatermarkDataImage.new({:Image => request_watermark_data_image})
      request = InsertWatermarkRequest.new(name: remote_file_name, watermark_data: request_watermark_data, folder: remote_data_folder, dest_file_name: remote_test_out + '/' + remote_file_name)

       result = @words_api.insert_watermark(request)
       assert_equal false, result.nil?
    end

    #
    # Test for adding watermark text online.
    #
    def test_insert_watermark_image_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_watermark_data_imageStream = File.open(File.join(local_test_folder, 'Common/aspose-cloud.png'))
      request_watermark_data_image = AsposeWordsCloud::FileReference.fromLocalFileContent(request_watermark_data_imageStream)
      request_watermark_data = WatermarkDataImage.new({:Image => request_watermark_data_image})
      request = InsertWatermarkOnlineRequest.new(document: request_document, watermark_data: request_watermark_data)

       result = @words_api.insert_watermark_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for adding watermark image.
    #
    def test_insert_watermark_image_deprecated
      remote_file_name = 'TestInsertWatermarkImage.docx'
      remote_image_path = remote_data_folder + '/TestInsertWatermarkImage.png'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name
      upload_file File.join(local_test_folder, 'Common/aspose-cloud.png'), remote_image_path

      request = InsertWatermarkImageRequest.new(name: remote_file_name, image_file: nil, folder: remote_data_folder, dest_file_name: remote_test_out + '/' + remote_file_name, image: remote_image_path)

       result = @words_api.insert_watermark_image(request)
       assert_equal false, result.nil?
    end

    #
    # Test for adding watermark image online.
    #
    def test_insert_watermark_image_deprecated_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_image_file = File.open(File.join(local_test_folder, 'Common/aspose-cloud.png'))
      request = InsertWatermarkImageOnlineRequest.new(document: request_document, image_file: request_image_file)

       result = @words_api.insert_watermark_image_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for adding watermark text.
    #
    def test_insert_watermark_text_deprecated
      remote_file_name = 'TestInsertWatermarkText.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_watermark_text = WatermarkText.new({:Text => 'This is the text', :RotationAngle => 90.0})
      request = InsertWatermarkTextRequest.new(name: remote_file_name, watermark_text: request_watermark_text, folder: remote_data_folder, dest_file_name: remote_test_out + '/' + remote_file_name)

       result = @words_api.insert_watermark_text(request)
       assert_equal false, result.nil?
    end

    #
    # Test for adding watermark text online.
    #
    def test_insert_watermark_text_deprecated_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_watermark_text = WatermarkText.new({:Text => 'This is the text', :RotationAngle => 90})
      request = InsertWatermarkTextOnlineRequest.new(document: request_document, watermark_text: request_watermark_text)

       result = @words_api.insert_watermark_text_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting watermark.
    #
    def test_delete_watermark
      remote_file_name = 'TestDeleteWatermark.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = DeleteWatermarkRequest.new(name: remote_file_name, folder: remote_data_folder, dest_file_name: remote_test_out + '/' + remote_file_name)

       result = @words_api.delete_watermark(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting watermark online.
    #
    def test_delete_watermark_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = DeleteWatermarkOnlineRequest.new(document: request_document)

       result = @words_api.delete_watermark_online(request)
       assert_equal false, result.nil?
    end
  end
end