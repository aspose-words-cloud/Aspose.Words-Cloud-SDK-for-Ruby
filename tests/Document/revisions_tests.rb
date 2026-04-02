# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="Revisions_tests.rb">
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
  # Example of how to accept all revisions in document.
  #
  class RevisionsTests < BaseTestContext
    def remote_data_folder
      remote_test_folder + '/DocumentActions/Revisions'
    end

    def local_file
      'DocumentElements/Revisions/TestRevisions.doc'
    end


    #
    # Test for accepting revisions in document.
    #
    def test_accept_all_revisions
      remote_file_name = 'TestAcceptAllRevisions.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = AcceptAllRevisionsRequest.new(name: remote_file_name, folder: remote_data_folder, dest_file_name: remote_test_out + '/' + remote_file_name)

       result = @words_api.accept_all_revisions(request)
       assert_equal false, result.nil?
    end

    #
    # Test for accepting revisions in document online.
    #
    def test_accept_all_revisions_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = AcceptAllRevisionsOnlineRequest.new(document: request_document)

       result = @words_api.accept_all_revisions_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for rejecting revisions in document.
    #
    def test_reject_all_revisions
      remote_file_name = 'TestRejectAllRevisions.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = RejectAllRevisionsRequest.new(name: remote_file_name, folder: remote_data_folder, dest_file_name: remote_test_out + '/' + remote_file_name)

       result = @words_api.reject_all_revisions(request)
       assert_equal false, result.nil?
    end

    #
    # Test for rejecting revisions in document online.
    #
    def test_reject_all_revisions_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = RejectAllRevisionsOnlineRequest.new(document: request_document)

       result = @words_api.reject_all_revisions_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting revisions from document.
    #
    def test_get_all_revisions
      remote_file_name = 'TestAcceptAllRevisions.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetAllRevisionsRequest.new(name: remote_file_name, folder: remote_data_folder)

       result = @words_api.get_all_revisions(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting revisions online from document.
    #
    def test_get_all_revisions_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetAllRevisionsOnlineRequest.new(document: request_document)

       result = @words_api.get_all_revisions_online(request)
       assert_equal false, result.nil?
    end
  end
end