# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="File_tests.rb">
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
  # Example of how to work with files.
  #
  class FileTests < BaseTestContext
    def remote_data_folder
      remote_test_folder + '/Storage'
    end

    def local_file
      'Common/test_multi_pages.docx'
    end


    #
    # Test for uploading file.
    #
    def test_upload_file
      remote_file_name = 'TestUploadFile.docx'

      request_file_content = File.open(File.join(local_test_folder, local_file))
      request = UploadFileRequest.new(file_content: request_file_content, path: remote_data_folder + '/' + remote_file_name)

       result = @words_api.upload_file(request)
       assert_equal false, result.nil?
    end

    #
    # Test for copy file.
    #
    def test_copy_file
      remote_file_name = 'TestCopyFileSrc.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = CopyFileRequest.new(dest_path: remote_data_folder + '/TestCopyFileDest.docx', src_path: remote_data_folder + '/' + remote_file_name)

       @words_api.copy_file(request)
    end

    #
    # Test for move file.
    #
    def test_move_file
      remote_file_name = 'TestMoveFileSrc.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = MoveFileRequest.new(dest_path: remote_test_out + '/TestMoveFileDest_' + generate_uuid + '.docx', src_path: remote_data_folder + '/' + remote_file_name)

       @words_api.move_file(request)
    end

    #
    # Test for delete file.
    #
    def test_delete_file
      remote_file_name = 'TestDeleteFile.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = DeleteFileRequest.new(path: remote_data_folder + '/' + remote_file_name)

       @words_api.delete_file(request)
    end

    #
    # Test for download file.
    #
    def test_download_file
      remote_file_name = 'TestDownloadFile.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = DownloadFileRequest.new(path: remote_data_folder + '/' + remote_file_name)

       result = @words_api.download_file(request)
       assert_equal false, result.nil?
    end
  end
end