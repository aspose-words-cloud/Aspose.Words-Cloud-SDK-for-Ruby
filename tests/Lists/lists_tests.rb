# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="Lists_tests.rb">
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
  # Example of how to work with lists.
  #
  class ListsTests < BaseTestContext
    def remote_data_folder
      remote_test_folder + '/DocumentElements/Lists'
    end

    def local_file
      'DocumentElements/Lists/ListsGet.doc'
    end


    #
    # Test for getting lists from document.
    #
    def test_get_lists
      remote_file_name = 'TestGetLists.doc'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetListsRequest.new(name: remote_file_name, folder: remote_data_folder)

       result = @words_api.get_lists(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting lists from document online.
    #
    def test_get_lists_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetListsOnlineRequest.new(document: request_document)

       result = @words_api.get_lists_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting list from document.
    #
    def test_get_list
      remote_file_name = 'TestGetList.doc'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetListRequest.new(name: remote_file_name, list_id: 1, folder: remote_data_folder)

       result = @words_api.get_list(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting list from document online.
    #
    def test_get_list_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetListOnlineRequest.new(document: request_document, list_id: 1)

       result = @words_api.get_list_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating list from document.
    #
    def test_update_list
      remote_file_name = 'TestUpdateList.doc'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_list_update = ListUpdate.new({:IsRestartAtEachSection => true})
      request = UpdateListRequest.new(name: remote_file_name, list_id: 1, list_update: request_list_update, folder: remote_data_folder)

       result = @words_api.update_list(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating list from document online.
    #
    def test_update_list_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_list_update = ListUpdate.new({:IsRestartAtEachSection => true})
      request = UpdateListOnlineRequest.new(document: request_document, list_id: 1, list_update: request_list_update)

       result = @words_api.update_list_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating list level from document.
    #
    def test_update_list_level
      remote_file_name = 'TestUpdateListLevel.doc'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_list_update = ListLevelUpdate.new({:Alignment => 'Right'})
      request = UpdateListLevelRequest.new(name: remote_file_name, list_id: 1, list_level: 1, list_update: request_list_update, folder: remote_data_folder)

       result = @words_api.update_list_level(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating list level from document online.
    #
    def test_update_list_level_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_list_update = ListLevelUpdate.new({:Alignment => 'Right'})
      request = UpdateListLevelOnlineRequest.new(document: request_document, list_id: 1, list_update: request_list_update, list_level: 1)

       result = @words_api.update_list_level_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for inserting list from document.
    #
    def test_insert_list
      remote_file_name = 'TestInsertList.doc'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_list_insert = ListInsert.new({:Template => 'OutlineLegal'})
      request = InsertListRequest.new(name: remote_file_name, list_insert: request_list_insert, folder: remote_data_folder)

       result = @words_api.insert_list(request)
       assert_equal false, result.nil?
    end

    #
    # Test for inserting list from document online.
    #
    def test_insert_list_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_list_insert = ListInsert.new({:Template => 'OutlineLegal'})
      request = InsertListOnlineRequest.new(document: request_document, list_insert: request_list_insert)

       result = @words_api.insert_list_online(request)
       assert_equal false, result.nil?
    end
  end
end