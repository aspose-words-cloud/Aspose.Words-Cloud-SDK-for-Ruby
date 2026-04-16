# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="Bookmark_tests.rb">
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
  # Example of how to get all bookmarks from document.
  #
  class BookmarkTests < BaseTestContext
    def remote_data_folder
      remote_test_folder + '/DocumentElements/Bookmarks'
    end

    def local_file
      'Common/test_multi_pages.docx'
    end

    def bookmark_name
      'aspose'
    end


    #
    # Test for getting bookmarks from document.
    #
    def test_get_bookmarks
      remote_file_name = 'TestGetDocumentBookmarks.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetBookmarksRequest.new(name: remote_file_name, folder: remote_data_folder)

       result = @words_api.get_bookmarks(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting bookmarks from document online.
    #
    def test_get_bookmarks_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetBookmarksOnlineRequest.new(document: request_document)

       result = @words_api.get_bookmarks_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting bookmark by specified name.
    #
    def test_get_bookmark_by_name
      remote_file_name = 'TestGetDocumentBookmarkByName.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetBookmarkByNameRequest.new(name: remote_file_name, bookmark_name: bookmark_name, folder: remote_data_folder)

       result = @words_api.get_bookmark_by_name(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting bookmark by specified name online.
    #
    def test_get_bookmark_by_name_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetBookmarkByNameOnlineRequest.new(document: request_document, bookmark_name: bookmark_name)

       result = @words_api.get_bookmark_by_name_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating existed bookmark.
    #
    def test_update_bookmark
      remote_file_name = 'TestUpdateDocumentBookmark.docx'
      bookmark_text = 'This will be the text for Aspose'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_bookmark_data = BookmarkData.new({:Name => bookmark_name, :Text => bookmark_text})
      request = UpdateBookmarkRequest.new(name: remote_file_name, bookmark_name: bookmark_name, bookmark_data: request_bookmark_data, folder: remote_data_folder, dest_file_name: remote_test_out + '/' + remote_file_name)

       result = @words_api.update_bookmark(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating existed bookmark online.
    #
    def test_update_bookmark_online
      remote_file_name = 'TestUpdateDocumentBookmark.docx'

      request_document = File.open(File.join(local_test_folder, local_file))
      request_bookmark_data = BookmarkData.new({:Name => bookmark_name, :Text => 'This will be the text for Aspose'})
      request = UpdateBookmarkOnlineRequest.new(document: request_document, bookmark_name: bookmark_name, bookmark_data: request_bookmark_data, dest_file_name: remote_test_out + '/' + remote_file_name)

       result = @words_api.update_bookmark_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting bookmark by specified name.
    #
    def test_delete_bookmark
      remote_file_name = 'TestDeleteBookmark.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = DeleteBookmarkRequest.new(name: remote_file_name, bookmark_name: bookmark_name, folder: remote_data_folder)

       @words_api.delete_bookmark(request)
    end

    #
    # Test for deleting bookmark by specified name online.
    #
    def test_delete_bookmark_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = DeleteBookmarkOnlineRequest.new(document: request_document, bookmark_name: bookmark_name)

       result = @words_api.delete_bookmark_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting all bookmarks from document.
    #
    def test_delete_bookmarks
      remote_file_name = 'TestDeleteBookmarks.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = DeleteBookmarksRequest.new(name: remote_file_name, folder: remote_data_folder)

       @words_api.delete_bookmarks(request)
    end

    #
    # Test for deleting all bookmarks from document online.
    #
    def test_delete_bookmarks_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = DeleteBookmarksOnlineRequest.new(document: request_document)

       result = @words_api.delete_bookmarks_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for inserting new bookmark.
    #
    def test_insert_bookmark
      remote_file_name = 'TestInsertBookmark.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_bookmark_start_range = PositionInsideNode.new({:NodeId => '0.0.0.0', :Offset => 0})
      request_bookmark_end_range = PositionInsideNode.new({:NodeId => '0.0.0.0', :Offset => 0})
      request_bookmark = BookmarkInsert.new({:StartRange => request_bookmark_start_range, :EndRange => request_bookmark_end_range, :Name => 'new_bookmark', :Text => 'Some text'})
      request = InsertBookmarkRequest.new(name: remote_file_name, bookmark: request_bookmark, folder: remote_data_folder)

       result = @words_api.insert_bookmark(request)
       assert_equal false, result.nil?
    end

    #
    # Test for inserting new bookmark online.
    #
    def test_insert_bookmark_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_bookmark_start_range = PositionInsideNode.new({:NodeId => '0.0.0.0', :Offset => 0})
      request_bookmark_end_range = PositionInsideNode.new({:NodeId => '0.0.0.0', :Offset => 0})
      request_bookmark = BookmarkInsert.new({:StartRange => request_bookmark_start_range, :EndRange => request_bookmark_end_range, :Name => 'new_bookmark', :Text => 'Some text'})
      request = InsertBookmarkOnlineRequest.new(document: request_document, bookmark: request_bookmark)

       result = @words_api.insert_bookmark_online(request)
       assert_equal false, result.nil?
    end
  end
end