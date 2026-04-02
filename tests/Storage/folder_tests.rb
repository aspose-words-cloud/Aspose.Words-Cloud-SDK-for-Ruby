# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="Folder_tests.rb">
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
  # Example of how to work with folders.
  #
  class FolderTests < BaseTestContext
    def remote_data_folder
      remote_test_folder + '/Storage'
    end

    def local_file
      'Common/test_multi_pages.docx'
    end


    #
    # Test for create folder.
    #
    def test_create_folder
      request = CreateFolderRequest.new(path: remote_data_folder + '/TestCreateFolder')

       @words_api.create_folder(request)
    end

    #
    # Test for delete folder.
    #
    def test_delete_folder
      test_delete_folder = remote_data_folder + '/TestDeleteFolder'

      upload_file File.join(local_test_folder, local_file), test_delete_folder + '/TestDeleteFolder.docx'

      request = DeleteFolderRequest.new(path: test_delete_folder, recursive: true)

       @words_api.delete_folder(request)
    end

    #
    # Test for get file list of folder.
    #
    def test_get_files_list
      request = GetFilesListRequest.new(path: remote_data_folder)

       result = @words_api.get_files_list(request)
       assert_equal false, result.nil?
    end

    #
    # Test for copy folder.
    #
    def test_copy_folder
      folder_to_copy = remote_data_folder + '/TestCopyFolder'

      upload_file File.join(local_test_folder, local_file), folder_to_copy + 'Src/TestCopyFolderSrc.docx'

      request = CopyFolderRequest.new(dest_path: folder_to_copy + 'Dest', src_path: folder_to_copy + 'Src')

       @words_api.copy_folder(request)
    end

    #
    # Test for move folder.
    #
    def test_move_folder
      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/TestMoveFolderSrc/TestMoveFolderSrc.docx'

      request = MoveFolderRequest.new(dest_path: remote_test_out + '/TestMoveFolderDest_' + generate_uuid, src_path: remote_data_folder + '/TestMoveFolderSrc')

       @words_api.move_folder(request)
    end
  end
end