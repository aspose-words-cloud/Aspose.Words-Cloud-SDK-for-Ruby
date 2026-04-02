# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="TableBorder_tests.rb">
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
  # Example of how to work with table borders.
  #
  class TableBorderTests < BaseTestContext
    def remote_data_folder
      remote_test_folder + '/DocumentElements/Tables'
    end

    def local_file
      'DocumentElements/Tables/TablesGet.docx'
    end


    #
    # Test for getting borders.
    #
    def test_get_borders
      remote_file_name = 'TestGetBorders.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetBordersRequest.new(name: remote_file_name, node_path: 'tables/1/rows/0/cells/0', folder: remote_data_folder)

       result = @words_api.get_borders(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting borders online.
    #
    def test_get_borders_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetBordersOnlineRequest.new(document: request_document, node_path: 'tables/1/rows/0/cells/0')

       result = @words_api.get_borders_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting border.
    #
    def test_get_border
      remote_file_name = 'TestGetBorder.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetBorderRequest.new(name: remote_file_name, border_type: 'left', node_path: 'tables/1/rows/0/cells/0', folder: remote_data_folder)

       result = @words_api.get_border(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting border online.
    #
    def test_get_border_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetBorderOnlineRequest.new(document: request_document, border_type: 'left', node_path: 'tables/1/rows/0/cells/0')

       result = @words_api.get_border_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting borders.
    #
    def test_delete_borders
      remote_file_name = 'TestDeleteBorders.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = DeleteBordersRequest.new(name: remote_file_name, node_path: 'tables/1/rows/0/cells/0', folder: remote_data_folder)

       result = @words_api.delete_borders(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting borders online.
    #
    def test_delete_borders_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = DeleteBordersOnlineRequest.new(document: request_document, node_path: 'tables/1/rows/0/cells/0')

       result = @words_api.delete_borders_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting border.
    #
    def test_delete_border
      remote_file_name = 'TestDeleteBorder.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = DeleteBorderRequest.new(name: remote_file_name, border_type: 'left', node_path: 'tables/1/rows/0/cells/0', folder: remote_data_folder)

       result = @words_api.delete_border(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting border online.
    #
    def test_delete_border_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = DeleteBorderOnlineRequest.new(document: request_document, border_type: 'left', node_path: 'tables/1/rows/0/cells/0')

       result = @words_api.delete_border_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating border.
    #
    def test_update_border
      remote_file_name = 'TestUpdateBorder.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_border_properties_color = XmlColor.new({:Web => '#AABBCC'})
      request_border_properties = Border.new({:BorderType => 'Left', :Color => request_border_properties_color, :DistanceFromText => 6.0, :LineStyle => 'DashDotStroker', :LineWidth => 2.0, :Shadow => true})
      request = UpdateBorderRequest.new(name: remote_file_name, border_type: 'left', border_properties: request_border_properties, node_path: 'tables/1/rows/0/cells/0', folder: remote_data_folder)

       result = @words_api.update_border(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating border online.
    #
    def test_update_border_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_border_properties_color = XmlColor.new({:Web => '#AABBCC'})
      request_border_properties = Border.new({:BorderType => 'Left', :Color => request_border_properties_color, :DistanceFromText => 6, :LineStyle => 'DashDotStroker', :LineWidth => 2, :Shadow => true})
      request = UpdateBorderOnlineRequest.new(document: request_document, border_properties: request_border_properties, border_type: 'left', node_path: 'tables/1/rows/0/cells/0')

       result = @words_api.update_border_online(request)
       assert_equal false, result.nil?
    end
  end
end