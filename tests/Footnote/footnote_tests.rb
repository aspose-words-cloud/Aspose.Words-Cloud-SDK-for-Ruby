# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="Footnote_tests.rb">
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
  # Example of how to work with footnotes.
  #
  class FootnoteTests < BaseTestContext
    def remote_data_folder
      remote_test_folder + '/DocumentElements/Footnotes'
    end

    def footnote_folder
      'DocumentElements/Footnotes'
    end


    #
    # Test for adding footnote.
    #
    def test_insert_footnote
      remote_file_name = 'TestInsertFootnote.docx'

      upload_file File.join(local_test_folder, footnote_folder + '/Footnote.doc'), remote_data_folder + '/' + remote_file_name

      request_footnote_dto = FootnoteInsert.new({:FootnoteType => 'Endnote', :Text => 'test endnote'})
      request = InsertFootnoteRequest.new(name: remote_file_name, footnote_dto: request_footnote_dto, node_path: '', folder: remote_data_folder)

       result = @words_api.insert_footnote(request)
       assert_equal false, result.nil?
    end

    #
    # Test for adding footnote online.
    #
    def test_insert_footnote_online
      request_document = File.open(File.join(local_test_folder, footnote_folder + '/Footnote.doc'))
      request_footnote_dto = FootnoteInsert.new({:FootnoteType => 'Endnote', :Text => 'test endnote'})
      request = InsertFootnoteOnlineRequest.new(document: request_document, footnote_dto: request_footnote_dto, node_path: '')

       result = @words_api.insert_footnote_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for adding footnote without node path.
    #
    def test_insert_footnote_without_node_path
      remote_file_name = 'TestInsertFootnoteWithoutNodePath.docx'

      upload_file File.join(local_test_folder, footnote_folder + '/Footnote.doc'), remote_data_folder + '/' + remote_file_name

      request_footnote_dto = FootnoteInsert.new({:FootnoteType => 'Endnote', :Text => 'test endnote'})
      request = InsertFootnoteRequest.new(name: remote_file_name, footnote_dto: request_footnote_dto, folder: remote_data_folder)

       result = @words_api.insert_footnote(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting footnote.
    #
    def test_delete_footnote
      remote_file_name = 'TestDeleteFootnote.docx'

      upload_file File.join(local_test_folder, footnote_folder + '/Footnote.doc'), remote_data_folder + '/' + remote_file_name

      request = DeleteFootnoteRequest.new(name: remote_file_name, index: 0, node_path: '', folder: remote_data_folder)

       @words_api.delete_footnote(request)
    end

    #
    # Test for deleting footnote online.
    #
    def test_delete_footnote_online
      request_document = File.open(File.join(local_test_folder, footnote_folder + '/Footnote.doc'))
      request = DeleteFootnoteOnlineRequest.new(document: request_document, index: 0, node_path: '')

       result = @words_api.delete_footnote_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting footnote without node path.
    #
    def test_delete_footnote_without_node_path
      remote_file_name = 'TestDeleteFootnoteWithoutNodePath.docx'

      upload_file File.join(local_test_folder, footnote_folder + '/Footnote.doc'), remote_data_folder + '/' + remote_file_name

      request = DeleteFootnoteRequest.new(name: remote_file_name, index: 0, folder: remote_data_folder)

       @words_api.delete_footnote(request)
    end

    #
    # Test for getting footnotes.
    #
    def test_get_footnotes
      remote_file_name = 'TestGetFootnotes.docx'

      upload_file File.join(local_test_folder, footnote_folder + '/Footnote.doc'), remote_data_folder + '/' + remote_file_name

      request = GetFootnotesRequest.new(name: remote_file_name, node_path: '', folder: remote_data_folder)

       result = @words_api.get_footnotes(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting footnotes online.
    #
    def test_get_footnotes_online
      request_document = File.open(File.join(local_test_folder, footnote_folder + '/Footnote.doc'))
      request = GetFootnotesOnlineRequest.new(document: request_document, node_path: '')

       result = @words_api.get_footnotes_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting footnotes without node path.
    #
    def test_get_footnotes_without_node_path
      remote_file_name = 'TestGetFootnotesWithoutNodePath.docx'

      upload_file File.join(local_test_folder, footnote_folder + '/Footnote.doc'), remote_data_folder + '/' + remote_file_name

      request = GetFootnotesRequest.new(name: remote_file_name, folder: remote_data_folder)

       result = @words_api.get_footnotes(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting footnote.
    #
    def test_get_footnote
      remote_file_name = 'TestGetFootnote.docx'

      upload_file File.join(local_test_folder, footnote_folder + '/Footnote.doc'), remote_data_folder + '/' + remote_file_name

      request = GetFootnoteRequest.new(name: remote_file_name, index: 0, node_path: '', folder: remote_data_folder)

       result = @words_api.get_footnote(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting footnote online.
    #
    def test_get_footnote_online
      request_document = File.open(File.join(local_test_folder, footnote_folder + '/Footnote.doc'))
      request = GetFootnoteOnlineRequest.new(document: request_document, index: 0, node_path: '')

       result = @words_api.get_footnote_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting footnote without node path.
    #
    def test_get_footnote_without_node_path
      remote_file_name = 'TestGetFootnoteWithoutNodePath.docx'

      upload_file File.join(local_test_folder, footnote_folder + '/Footnote.doc'), remote_data_folder + '/' + remote_file_name

      request = GetFootnoteRequest.new(name: remote_file_name, index: 0, folder: remote_data_folder)

       result = @words_api.get_footnote(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating footnote.
    #
    def test_update_footnote
      remote_file_name = 'TestUpdateFootnote.docx'

      upload_file File.join(local_test_folder, footnote_folder + '/Footnote.doc'), remote_data_folder + '/' + remote_file_name

      request_footnote_dto = FootnoteUpdate.new({:Text => 'new text is here'})
      request = UpdateFootnoteRequest.new(name: remote_file_name, index: 0, footnote_dto: request_footnote_dto, node_path: '', folder: remote_data_folder)

       result = @words_api.update_footnote(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating footnote online.
    #
    def test_update_footnote_online
      request_document = File.open(File.join(local_test_folder, footnote_folder + '/Footnote.doc'))
      request_footnote_dto = FootnoteUpdate.new({:Text => 'new text is here'})
      request = UpdateFootnoteOnlineRequest.new(document: request_document, footnote_dto: request_footnote_dto, index: 0, node_path: '')

       result = @words_api.update_footnote_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating footnote without node path.
    #
    def test_update_footnote_without_node_path
      remote_file_name = 'TestUpdateFootnoteWithoutNodePath.docx'

      upload_file File.join(local_test_folder, footnote_folder + '/Footnote.doc'), remote_data_folder + '/' + remote_file_name

      request_footnote_dto = FootnoteUpdate.new({:Text => 'new text is here'})
      request = UpdateFootnoteRequest.new(name: remote_file_name, index: 0, footnote_dto: request_footnote_dto, folder: remote_data_folder)

       result = @words_api.update_footnote(request)
       assert_equal false, result.nil?
    end
  end
end