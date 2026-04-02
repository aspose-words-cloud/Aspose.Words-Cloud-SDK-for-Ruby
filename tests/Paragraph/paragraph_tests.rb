# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="Paragraph_tests.rb">
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
  # Example of how to work with paragraph.
  #
  class ParagraphTests < BaseTestContext
    def remote_data_folder
      remote_test_folder + '/DocumentElements/Paragraphs'
    end

    def local_file
      'Common/test_multi_pages.docx'
    end

    def list_folder
      'DocumentElements/ParagraphListFormat'
    end

    def tab_stop_folder
      'DocumentElements/Paragraphs'
    end


    #
    # Test for getting paragraph.
    #
    def test_get_document_paragraph_by_index
      remote_file_name = 'TestGetDocumentParagraphByIndex.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetParagraphRequest.new(name: remote_file_name, index: 0, node_path: 'sections/0', folder: remote_data_folder)

       result = @words_api.get_paragraph(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting paragraph online.
    #
    def test_get_document_paragraph_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetParagraphOnlineRequest.new(document: request_document, index: 0, node_path: 'sections/0')

       result = @words_api.get_paragraph_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting paragraph without node path.
    #
    def test_get_document_paragraph_by_index_without_node_path
      remote_file_name = 'TestGetDocumentParagraphByIndexWithoutNodePath.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetParagraphRequest.new(name: remote_file_name, index: 0, folder: remote_data_folder)

       result = @words_api.get_paragraph(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting all paragraphs.
    #
    def test_get_document_paragraphs
      remote_file_name = 'TestGetDocumentParagraphs.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetParagraphsRequest.new(name: remote_file_name, node_path: 'sections/0', folder: remote_data_folder)

       result = @words_api.get_paragraphs(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting all paragraphs online.
    #
    def test_get_document_paragraphs_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetParagraphsOnlineRequest.new(document: request_document, node_path: 'sections/0')

       result = @words_api.get_paragraphs_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting all paragraphs without node path.
    #
    def test_get_document_paragraphs_without_node_path
      remote_file_name = 'TestGetDocumentParagraphsWithoutNodePath.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetParagraphsRequest.new(name: remote_file_name, folder: remote_data_folder)

       result = @words_api.get_paragraphs(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting paragraph run.
    #
    def test_get_document_paragraph_run
      remote_file_name = 'TestGetDocumentParagraphRun.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetRunRequest.new(name: remote_file_name, paragraph_path: 'paragraphs/0', index: 0, folder: remote_data_folder)

       result = @words_api.get_run(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting paragraph run online.
    #
    def test_get_document_paragraph_run_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetRunOnlineRequest.new(document: request_document, paragraph_path: 'paragraphs/0', index: 0)

       result = @words_api.get_run_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting paragraph run font.
    #
    def test_get_document_paragraph_run_font
      remote_file_name = 'TestGetDocumentParagraphRunFont.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetRunFontRequest.new(name: remote_file_name, paragraph_path: 'paragraphs/0', index: 0, folder: remote_data_folder)

       result = @words_api.get_run_font(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting paragraph run font online.
    #
    def test_get_document_paragraph_run_font_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetRunFontOnlineRequest.new(document: request_document, paragraph_path: 'paragraphs/0', index: 0)

       result = @words_api.get_run_font_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting paragraph runs.
    #
    def test_get_paragraph_runs
      remote_file_name = 'TestGetParagraphRuns.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetRunsRequest.new(name: remote_file_name, paragraph_path: 'sections/0/paragraphs/0', folder: remote_data_folder)

       result = @words_api.get_runs(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting paragraph runs online.
    #
    def test_get_paragraph_runs_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetRunsOnlineRequest.new(document: request_document, paragraph_path: 'sections/0/paragraphs/0')

       result = @words_api.get_runs_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating paragraph run font.
    #
    def test_update_run_font
      remote_file_name = 'TestUpdateRunFont.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_font_dto = Font.new({:Bold => true})
      request = UpdateRunFontRequest.new(name: remote_file_name, paragraph_path: 'paragraphs/0', index: 0, font_dto: request_font_dto, folder: remote_data_folder, dest_file_name: remote_test_out + '/' + remote_file_name)

       result = @words_api.update_run_font(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating paragraph run font online.
    #
    def test_update_run_font_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_font_dto = Font.new({:Bold => true})
      request = UpdateRunFontOnlineRequest.new(document: request_document, paragraph_path: 'paragraphs/0', font_dto: request_font_dto, index: 0)

       result = @words_api.update_run_font_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for adding paragraph.
    #
    def test_insert_paragraph
      remote_file_name = 'TestInsertParagraph.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_paragraph = ParagraphInsert.new({:Text => 'This is a new paragraph for your document'})
      request = InsertParagraphRequest.new(name: remote_file_name, paragraph: request_paragraph, node_path: 'sections/0', folder: remote_data_folder)

       result = @words_api.insert_paragraph(request)
       assert_equal false, result.nil?
    end

    #
    # Test for adding paragraph online.
    #
    def test_insert_paragraph_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_paragraph = ParagraphInsert.new({:Text => 'This is a new paragraph for your document'})
      request = InsertParagraphOnlineRequest.new(document: request_document, paragraph: request_paragraph, node_path: 'sections/0')

       result = @words_api.insert_paragraph_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for adding paragraph without node path.
    #
    def test_insert_paragraph_without_node_path
      remote_file_name = 'TestInsertParagraphWithoutNodePath.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_paragraph = ParagraphInsert.new({:Text => 'This is a new paragraph for your document'})
      request = InsertParagraphRequest.new(name: remote_file_name, paragraph: request_paragraph, folder: remote_data_folder)

       result = @words_api.insert_paragraph(request)
       assert_equal false, result.nil?
    end

    #
    # Test for paragraph rendering.
    #
    def test_render_paragraph
      remote_file_name = 'TestRenderParagraph.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = RenderParagraphRequest.new(name: remote_file_name, format: 'png', index: 0, node_path: '', folder: remote_data_folder)

       result = @words_api.render_paragraph(request)
       assert_equal false, result.nil?
    end

    #
    # Test for paragraph rendering.
    #
    def test_render_paragraph_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = RenderParagraphOnlineRequest.new(document: request_document, format: 'png', index: 0, node_path: '')

       result = @words_api.render_paragraph_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for paragraph rendering without node path.
    #
    def test_render_paragraph_without_node_path
      remote_file_name = 'TestRenderParagraphWithoutNodePath.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = RenderParagraphRequest.new(name: remote_file_name, format: 'png', index: 0, folder: remote_data_folder)

       result = @words_api.render_paragraph(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting paragraph format settings.
    #
    def test_get_paragraph_format
      remote_file_name = 'TestGetDocumentParagraphs.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetParagraphFormatRequest.new(name: remote_file_name, index: 0, node_path: '', folder: remote_data_folder)

       result = @words_api.get_paragraph_format(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting paragraph format settings online.
    #
    def test_get_paragraph_format_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetParagraphFormatOnlineRequest.new(document: request_document, index: 0, node_path: '')

       result = @words_api.get_paragraph_format_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting paragraph format settings without node path.
    #
    def test_get_paragraph_format_without_node_path
      remote_file_name = 'TestGetDocumentParagraphsWithoutNodePath.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetParagraphFormatRequest.new(name: remote_file_name, index: 0, folder: remote_data_folder)

       result = @words_api.get_paragraph_format(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating  paragraph format settings.
    #
    def test_update_paragraph_format
      remote_file_name = 'TestGetDocumentParagraphs.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_paragraph_format_dto = ParagraphFormatUpdate.new({:Alignment => 'Right'})
      request = UpdateParagraphFormatRequest.new(name: remote_file_name, index: 0, paragraph_format_dto: request_paragraph_format_dto, node_path: '', folder: remote_data_folder)

       result = @words_api.update_paragraph_format(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating  paragraph format settings online.
    #
    def test_update_paragraph_format_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_paragraph_format_dto = ParagraphFormatUpdate.new({:Alignment => 'Right'})
      request = UpdateParagraphFormatOnlineRequest.new(document: request_document, paragraph_format_dto: request_paragraph_format_dto, index: 0, node_path: '')

       result = @words_api.update_paragraph_format_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting  a paragraph.
    #
    def test_delete_paragraph
      remote_file_name = 'TestDeleteParagraph.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = DeleteParagraphRequest.new(name: remote_file_name, index: 0, node_path: '', folder: remote_data_folder)

       @words_api.delete_paragraph(request)
    end

    #
    # Test for deleting  a paragraph online.
    #
    def test_delete_paragraph_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = DeleteParagraphOnlineRequest.new(document: request_document, index: 0, node_path: '')

       result = @words_api.delete_paragraph_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting  a paragraph without node path.
    #
    def test_delete_paragraph_without_node_path
      remote_file_name = 'TestDeleteParagraphWithoutNodePath.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = DeleteParagraphRequest.new(name: remote_file_name, index: 0, folder: remote_data_folder)

       @words_api.delete_paragraph(request)
    end

    #
    # Test for getting paragraph list format.
    #
    def test_get_paragraph_list_format
      remote_file_name = 'TestParagraphGetListFormat.docx'

      upload_file File.join(local_test_folder, list_folder + '/ParagraphGetListFormat.doc'), remote_data_folder + '/' + remote_file_name

      request = GetParagraphListFormatRequest.new(name: remote_file_name, index: 0, node_path: '', folder: remote_data_folder)

       result = @words_api.get_paragraph_list_format(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting paragraph list format online.
    #
    def test_get_paragraph_list_format_online
      request_document = File.open(File.join(local_test_folder, list_folder + '/ParagraphGetListFormat.doc'))
      request = GetParagraphListFormatOnlineRequest.new(document: request_document, index: 0, node_path: '')

       result = @words_api.get_paragraph_list_format_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting paragraph list format without node path.
    #
    def test_get_paragraph_list_format_without_node_path
      remote_file_name = 'TestParagraphGetListFormatWithoutNodePath.docx'

      upload_file File.join(local_test_folder, list_folder + '/ParagraphGetListFormat.doc'), remote_data_folder + '/' + remote_file_name

      request = GetParagraphListFormatRequest.new(name: remote_file_name, index: 0, folder: remote_data_folder)

       result = @words_api.get_paragraph_list_format(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating paragraph list format.
    #
    def test_update_paragraph_list_format
      remote_file_name = 'TestUpdateParagraphListFormat.docx'

      upload_file File.join(local_test_folder, list_folder + '/ParagraphUpdateListFormat.doc'), remote_data_folder + '/' + remote_file_name

      request_list_format_dto = ListFormatUpdate.new({:ListId => 2})
      request = UpdateParagraphListFormatRequest.new(name: remote_file_name, index: 0, list_format_dto: request_list_format_dto, node_path: '', folder: remote_data_folder)

       result = @words_api.update_paragraph_list_format(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating paragraph list format online.
    #
    def test_update_paragraph_list_format_online
      request_document = File.open(File.join(local_test_folder, list_folder + '/ParagraphUpdateListFormat.doc'))
      request_list_format_dto = ListFormatUpdate.new({:ListId => 2})
      request = UpdateParagraphListFormatOnlineRequest.new(document: request_document, list_format_dto: request_list_format_dto, index: 0, node_path: '')

       result = @words_api.update_paragraph_list_format_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating paragraph list format without node path.
    #
    def test_update_paragraph_list_format_without_node_path
      remote_file_name = 'TestUpdateParagraphListFormatWithoutNodePath.docx'

      upload_file File.join(local_test_folder, list_folder + '/ParagraphUpdateListFormat.doc'), remote_data_folder + '/' + remote_file_name

      request_list_format_dto = ListFormatUpdate.new({:ListId => 2})
      request = UpdateParagraphListFormatRequest.new(name: remote_file_name, index: 0, list_format_dto: request_list_format_dto, folder: remote_data_folder)

       result = @words_api.update_paragraph_list_format(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting paragraph list format.
    #
    def test_delete_paragraph_list_format
      remote_file_name = 'TestDeleteParagraphListFormat.docx'

      upload_file File.join(local_test_folder, list_folder + '/ParagraphDeleteListFormat.doc'), remote_data_folder + '/' + remote_file_name

      request = DeleteParagraphListFormatRequest.new(name: remote_file_name, index: 0, node_path: '', folder: remote_data_folder)

       result = @words_api.delete_paragraph_list_format(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting paragraph list format online.
    #
    def test_delete_paragraph_list_format_online
      request_document = File.open(File.join(local_test_folder, list_folder + '/ParagraphDeleteListFormat.doc'))
      request = DeleteParagraphListFormatOnlineRequest.new(document: request_document, index: 0, node_path: '')

       result = @words_api.delete_paragraph_list_format_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting paragraph list format without node path.
    #
    def test_delete_paragraph_list_format_without_node_path
      remote_file_name = 'TestDeleteParagraphListFormatWithoutNodePath.docx'

      upload_file File.join(local_test_folder, list_folder + '/ParagraphDeleteListFormat.doc'), remote_data_folder + '/' + remote_file_name

      request = DeleteParagraphListFormatRequest.new(name: remote_file_name, index: 0, folder: remote_data_folder)

       result = @words_api.delete_paragraph_list_format(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting paragraph tab stops.
    #
    def test_get_paragraph_tab_stops
      remote_file_name = 'TestGetParagraphTabStops.docx'

      upload_file File.join(local_test_folder, tab_stop_folder + '/ParagraphTabStops.docx'), remote_data_folder + '/' + remote_file_name

      request = GetParagraphTabStopsRequest.new(name: remote_file_name, index: 0, node_path: '', folder: remote_data_folder)

       result = @words_api.get_paragraph_tab_stops(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting paragraph tab stops online.
    #
    def test_get_paragraph_tab_stops_online
      request_document = File.open(File.join(local_test_folder, tab_stop_folder + '/ParagraphTabStops.docx'))
      request = GetParagraphTabStopsOnlineRequest.new(document: request_document, index: 0, node_path: '')

       result = @words_api.get_paragraph_tab_stops_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting paragraph tab stops without node path.
    #
    def test_get_paragraph_tab_stops_without_node_path
      remote_file_name = 'TestGetParagraphTabStopsWithoutNodePath.docx'

      upload_file File.join(local_test_folder, tab_stop_folder + '/ParagraphTabStops.docx'), remote_data_folder + '/' + remote_file_name

      request = GetParagraphTabStopsRequest.new(name: remote_file_name, index: 0, folder: remote_data_folder)

       result = @words_api.get_paragraph_tab_stops(request)
       assert_equal false, result.nil?
    end

    #
    # Test for inserting paragraph tab stop.
    #
    def test_insert_paragraph_tab_stops
      remote_file_name = 'TestInsertOrUpdateParagraphTabStop.docx'

      upload_file File.join(local_test_folder, tab_stop_folder + '/ParagraphTabStops.docx'), remote_data_folder + '/' + remote_file_name

      request_tab_stop_insert_dto = TabStopInsert.new({:Alignment => 'Left', :Leader => 'None', :Position => 100.0})
      request = InsertOrUpdateParagraphTabStopRequest.new(name: remote_file_name, index: 0, tab_stop_insert_dto: request_tab_stop_insert_dto, node_path: '', folder: remote_data_folder)

       result = @words_api.insert_or_update_paragraph_tab_stop(request)
       assert_equal false, result.nil?
    end

    #
    # Test for inserting paragraph tab stop online.
    #
    def test_insert_paragraph_tab_stops_online
      request_document = File.open(File.join(local_test_folder, tab_stop_folder + '/ParagraphTabStops.docx'))
      request_tab_stop_insert_dto = TabStopInsert.new({:Alignment => 'Left', :Leader => 'None', :Position => 72})
      request = InsertOrUpdateParagraphTabStopOnlineRequest.new(document: request_document, tab_stop_insert_dto: request_tab_stop_insert_dto, index: 0, node_path: '')

       result = @words_api.insert_or_update_paragraph_tab_stop_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for inserting paragraph tab stop without node path.
    #
    def test_insert_paragraph_tab_stops_without_node_path
      remote_file_name = 'TestInsertOrUpdateParagraphTabStopWithoutNodePath.docx'

      upload_file File.join(local_test_folder, tab_stop_folder + '/ParagraphTabStops.docx'), remote_data_folder + '/' + remote_file_name

      request_tab_stop_insert_dto = TabStopInsert.new({:Alignment => 'Left', :Leader => 'None', :Position => 100.0})
      request = InsertOrUpdateParagraphTabStopRequest.new(name: remote_file_name, index: 0, tab_stop_insert_dto: request_tab_stop_insert_dto, folder: remote_data_folder)

       result = @words_api.insert_or_update_paragraph_tab_stop(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting all paragraph tab stops.
    #
    def test_delete_all_paragraph_tab_stops
      remote_file_name = 'TestDeleteAllParagraphTabStops.docx'

      upload_file File.join(local_test_folder, tab_stop_folder + '/ParagraphTabStops.docx'), remote_data_folder + '/' + remote_file_name

      request = DeleteAllParagraphTabStopsRequest.new(name: remote_file_name, index: 0, node_path: '', folder: remote_data_folder)

       result = @words_api.delete_all_paragraph_tab_stops(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting all paragraph tab stops online.
    #
    def test_delete_all_paragraph_tab_stops_online
      request_document = File.open(File.join(local_test_folder, tab_stop_folder + '/ParagraphTabStops.docx'))
      request = DeleteAllParagraphTabStopsOnlineRequest.new(document: request_document, index: 0, node_path: '')

       result = @words_api.delete_all_paragraph_tab_stops_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting all paragraph tab stops without node path.
    #
    def test_delete_all_paragraph_tab_stops_without_node_path
      remote_file_name = 'TestDeleteAllParagraphTabStopsWithoutNodePath.docx'

      upload_file File.join(local_test_folder, tab_stop_folder + '/ParagraphTabStops.docx'), remote_data_folder + '/' + remote_file_name

      request = DeleteAllParagraphTabStopsRequest.new(name: remote_file_name, index: 0, folder: remote_data_folder)

       result = @words_api.delete_all_paragraph_tab_stops(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting a tab stops.
    #
    def test_delete_paragraph_tab_stop
      remote_file_name = 'TestDeleteParagraphTabStop.docx'

      upload_file File.join(local_test_folder, tab_stop_folder + '/ParagraphTabStops.docx'), remote_data_folder + '/' + remote_file_name

      request = DeleteParagraphTabStopRequest.new(name: remote_file_name, position: 72.0, index: 0, node_path: '', folder: remote_data_folder)

       result = @words_api.delete_paragraph_tab_stop(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting a tab stops online.
    #
    def test_delete_paragraph_tab_stop_online
      request_document = File.open(File.join(local_test_folder, tab_stop_folder + '/ParagraphTabStops.docx'))
      request = DeleteParagraphTabStopOnlineRequest.new(document: request_document, position: 72.0, index: 0, node_path: '')

       result = @words_api.delete_paragraph_tab_stop_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting a tab stops without node path.
    #
    def test_delete_paragraph_tab_stop_without_node_path
      remote_file_name = 'TestDeleteParagraphTabStopWithoutNodePath.docx'

      upload_file File.join(local_test_folder, tab_stop_folder + '/ParagraphTabStops.docx'), remote_data_folder + '/' + remote_file_name

      request = DeleteParagraphTabStopRequest.new(name: remote_file_name, position: 72.0, index: 0, folder: remote_data_folder)

       result = @words_api.delete_paragraph_tab_stop(request)
       assert_equal false, result.nil?
    end
  end
end