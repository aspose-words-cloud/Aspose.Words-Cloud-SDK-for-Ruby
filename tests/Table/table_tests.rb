# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="Table_tests.rb">
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
  # Example of how to work wtih table.
  #
  class TableTests < BaseTestContext
    def remote_data_folder
      remote_test_folder + '/DocumentElements/Tables'
    end

    def local_file
      'DocumentElements/Tables/TablesGet.docx'
    end


    #
    # Test for getting tables.
    #
    def test_get_tables
      remote_file_name = 'TestGetTables.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetTablesRequest.new(name: remote_file_name, node_path: '', folder: remote_data_folder)

       result = @words_api.get_tables(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting tables online.
    #
    def test_get_tables_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetTablesOnlineRequest.new(document: request_document, node_path: '')

       result = @words_api.get_tables_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting tables without node path.
    #
    def test_get_tables_without_node_path
      remote_file_name = 'TestGetTablesWithoutNodePath.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetTablesRequest.new(name: remote_file_name, folder: remote_data_folder)

       result = @words_api.get_tables(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting table.
    #
    def test_get_table
      remote_file_name = 'TestGetTable.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetTableRequest.new(name: remote_file_name, index: 1, node_path: '', folder: remote_data_folder)

       result = @words_api.get_table(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting table online.
    #
    def test_get_table_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetTableOnlineRequest.new(document: request_document, index: 1, node_path: '')

       result = @words_api.get_table_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting table without node path.
    #
    def test_get_table_without_node_path
      remote_file_name = 'TestGetTableWithoutNodePath.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetTableRequest.new(name: remote_file_name, index: 1, folder: remote_data_folder)

       result = @words_api.get_table(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting table.
    #
    def test_delete_table
      remote_file_name = 'TestDeleteTable.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = DeleteTableRequest.new(name: remote_file_name, index: 1, node_path: '', folder: remote_data_folder)

       @words_api.delete_table(request)
    end

    #
    # Test for deleting table online.
    #
    def test_delete_table_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = DeleteTableOnlineRequest.new(document: request_document, index: 1, node_path: '')

       result = @words_api.delete_table_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting table without node path.
    #
    def test_delete_table_without_node_path
      remote_file_name = 'TestDeleteTableWithoutNodePath.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = DeleteTableRequest.new(name: remote_file_name, index: 1, folder: remote_data_folder)

       @words_api.delete_table(request)
    end

    #
    # Test for adding table.
    #
    def test_insert_table
      remote_file_name = 'TestInsertTable.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_table = TableInsert.new({:ColumnsCount => 5, :RowsCount => 4})
      request = InsertTableRequest.new(name: remote_file_name, table: request_table, node_path: '', folder: remote_data_folder)

       result = @words_api.insert_table(request)
       assert_equal false, result.nil?
    end

    #
    # Test for adding table online.
    #
    def test_insert_table_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_table = TableInsert.new({:ColumnsCount => 5, :RowsCount => 4})
      request = InsertTableOnlineRequest.new(document: request_document, table: request_table, node_path: '')

       result = @words_api.insert_table_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for adding table without node path.
    #
    def test_insert_table_without_node_path
      remote_file_name = 'TestInsertTableWithoutNodePath.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_table = TableInsert.new({:ColumnsCount => 5, :RowsCount => 4})
      request = InsertTableRequest.new(name: remote_file_name, table: request_table, folder: remote_data_folder)

       result = @words_api.insert_table(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting document properties.
    #
    def test_get_table_properties
      remote_file_name = 'TestGetTableProperties.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetTablePropertiesRequest.new(name: remote_file_name, index: 1, node_path: '', folder: remote_data_folder)

       result = @words_api.get_table_properties(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting document properties online.
    #
    def test_get_table_properties_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetTablePropertiesOnlineRequest.new(document: request_document, index: 1, node_path: '')

       result = @words_api.get_table_properties_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting document properties without node path.
    #
    def test_get_table_properties_without_node_path
      remote_file_name = 'TestGetTablePropertiesWithoutNodePath.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetTablePropertiesRequest.new(name: remote_file_name, index: 1, folder: remote_data_folder)

       result = @words_api.get_table_properties(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating table properties.
    #
    def test_update_table_properties
      remote_file_name = 'TestUpdateTableProperties.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_properties = TableProperties.new({:Alignment => 'Right', :AllowAutoFit => false, :Bidi => true, :BottomPadding => 1, :CellSpacing => 2.0, :StyleOptions => 'ColumnBands'})
      request = UpdateTablePropertiesRequest.new(name: remote_file_name, index: 1, properties: request_properties, node_path: '', folder: remote_data_folder)

       result = @words_api.update_table_properties(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating table properties online.
    #
    def test_update_table_properties_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_properties = TableProperties.new({:Alignment => 'Right', :AllowAutoFit => false, :Bidi => true, :BottomPadding => 1, :CellSpacing => 2, :StyleOptions => 'ColumnBands'})
      request = UpdateTablePropertiesOnlineRequest.new(document: request_document, properties: request_properties, index: 1, node_path: '')

       result = @words_api.update_table_properties_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating table properties without node path.
    #
    def test_update_table_properties_without_node_path
      remote_file_name = 'TestUpdateTablePropertiesWithoutNodePath.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_properties = TableProperties.new({:Alignment => 'Right', :AllowAutoFit => false, :Bidi => true, :BottomPadding => 1.0, :CellSpacing => 2.0, :StyleOptions => 'ColumnBands'})
      request = UpdateTablePropertiesRequest.new(name: remote_file_name, index: 1, properties: request_properties, folder: remote_data_folder)

       result = @words_api.update_table_properties(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting table row.
    #
    def test_get_table_row
      remote_file_name = 'TestGetTableRow.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetTableRowRequest.new(name: remote_file_name, table_path: 'tables/1', index: 0, folder: remote_data_folder)

       result = @words_api.get_table_row(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting table row online.
    #
    def test_get_table_row_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetTableRowOnlineRequest.new(document: request_document, table_path: 'tables/1', index: 0)

       result = @words_api.get_table_row_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting table row.
    #
    def test_delete_table_row
      remote_file_name = 'TestDeleteTableRow.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = DeleteTableRowRequest.new(name: remote_file_name, table_path: 'tables/1', index: 0, folder: remote_data_folder)

       @words_api.delete_table_row(request)
    end

    #
    # Test for deleting table row online.
    #
    def test_delete_table_row_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = DeleteTableRowOnlineRequest.new(document: request_document, table_path: 'tables/1', index: 0)

       result = @words_api.delete_table_row_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for adding row.
    #
    def test_insert_table_row
      remote_file_name = 'TestInsertTableRow.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_row = TableRowInsert.new({:ColumnsCount => 5})
      request = InsertTableRowRequest.new(name: remote_file_name, row: request_row, node_path: 'sections/0/tables/2', folder: remote_data_folder)

       result = @words_api.insert_table_row(request)
       assert_equal false, result.nil?
    end

    #
    # Test for adding row online.
    #
    def test_insert_table_row_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_row = TableRowInsert.new({:ColumnsCount => 5})
      request = InsertTableRowOnlineRequest.new(document: request_document, row: request_row, node_path: 'sections/0/tables/2')

       result = @words_api.insert_table_row_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting row format.
    #
    def test_get_table_row_format
      remote_file_name = 'TestGetTableRowFormat.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetTableRowFormatRequest.new(name: remote_file_name, table_path: 'sections/0/tables/2', index: 0, folder: remote_data_folder)

       result = @words_api.get_table_row_format(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting row format online.
    #
    def test_get_table_row_format_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetTableRowFormatOnlineRequest.new(document: request_document, table_path: 'sections/0/tables/2', index: 0)

       result = @words_api.get_table_row_format_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test updating row format.
    #
    def test_update_table_row_format
      remote_file_name = 'TestUpdateTableRowFormat.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_format = TableRowFormat.new({:AllowBreakAcrossPages => true, :HeadingFormat => true, :Height => 10.0, :HeightRule => 'Exactly'})
      request = UpdateTableRowFormatRequest.new(name: remote_file_name, table_path: 'sections/0/tables/2', index: 0, format: request_format, folder: remote_data_folder)

       result = @words_api.update_table_row_format(request)
       assert_equal false, result.nil?
    end

    #
    # Test updating row format online.
    #
    def test_update_table_row_format_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_format = TableRowFormat.new({:AllowBreakAcrossPages => true, :HeadingFormat => true, :Height => 10, :HeightRule => 'Auto'})
      request = UpdateTableRowFormatOnlineRequest.new(document: request_document, table_path: 'sections/0/tables/2', format: request_format, index: 0)

       result = @words_api.update_table_row_format_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting table cell.
    #
    def test_get_table_cell
      remote_file_name = 'TestGetTableCell.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetTableCellRequest.new(name: remote_file_name, table_row_path: 'sections/0/tables/2/rows/0', index: 0, folder: remote_data_folder)

       result = @words_api.get_table_cell(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting table cell online.
    #
    def test_get_table_cell_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetTableCellOnlineRequest.new(document: request_document, table_row_path: 'sections/0/tables/2/rows/0', index: 0)

       result = @words_api.get_table_cell_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for deleting cell.
    #
    def test_delete_table_cell
      remote_file_name = 'TestDeleteTableCell.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = DeleteTableCellRequest.new(name: remote_file_name, table_row_path: 'sections/0/tables/2/rows/0', index: 0, folder: remote_data_folder)

       @words_api.delete_table_cell(request)
    end

    #
    # Test for deleting cell online.
    #
    def test_delete_table_cell_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = DeleteTableCellOnlineRequest.new(document: request_document, table_row_path: 'sections/0/tables/2/rows/0', index: 0)

       result = @words_api.delete_table_cell_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for adding cell.
    #
    def test_insert_table_cell
      remote_file_name = 'TestInsertTableCell.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_cell = TableCellInsert.new({})
      request = InsertTableCellRequest.new(name: remote_file_name, cell: request_cell, table_row_path: 'sections/0/tables/2/rows/0', folder: remote_data_folder)

       result = @words_api.insert_table_cell(request)
       assert_equal false, result.nil?
    end

    #
    # Test for adding cell online.
    #
    def test_insert_table_cell_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_cell = TableCellInsert.new({})
      request = InsertTableCellOnlineRequest.new(document: request_document, cell: request_cell, table_row_path: 'sections/0/tables/2/rows/0')

       result = @words_api.insert_table_cell_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting cell format.
    #
    def test_get_table_cell_format
      remote_file_name = 'TestGetTableCellFormat.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetTableCellFormatRequest.new(name: remote_file_name, table_row_path: 'sections/0/tables/2/rows/0', index: 0, folder: remote_data_folder)

       result = @words_api.get_table_cell_format(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting cell format online.
    #
    def test_get_table_cell_format_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetTableCellFormatOnlineRequest.new(document: request_document, table_row_path: 'sections/0/tables/2/rows/0', index: 0)

       result = @words_api.get_table_cell_format_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating cell format.
    #
    def test_update_table_cell_format
      remote_file_name = 'TestUpdateTableCellFormat.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_format = TableCellFormat.new({:BottomPadding => 5.0, :FitText => true, :HorizontalMerge => 'First', :WrapText => true})
      request = UpdateTableCellFormatRequest.new(name: remote_file_name, table_row_path: 'sections/0/tables/2/rows/0', index: 0, format: request_format, folder: remote_data_folder)

       result = @words_api.update_table_cell_format(request)
       assert_equal false, result.nil?
    end

    #
    # Test for updating cell format online.
    #
    def test_update_table_cell_format_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_format = TableCellFormat.new({:BottomPadding => 5, :FitText => true, :HorizontalMerge => 'First', :WrapText => true})
      request = UpdateTableCellFormatOnlineRequest.new(document: request_document, table_row_path: 'sections/0/tables/2/rows/0', format: request_format, index: 0)

       result = @words_api.update_table_cell_format_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for table rendering.
    #
    def test_render_table
      remote_file_name = 'TestRenderTable.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = RenderTableRequest.new(name: remote_file_name, format: 'png', index: 0, node_path: '', folder: remote_data_folder)

       result = @words_api.render_table(request)
       assert_equal false, result.nil?
    end

    #
    # Test for table rendering.
    #
    def test_render_table_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = RenderTableOnlineRequest.new(document: request_document, format: 'png', index: 0, node_path: '')

       result = @words_api.render_table_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for table rendering without node path.
    #
    def test_render_table_without_node_path
      remote_file_name = 'TestRenderTableWithoutNodePath.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = RenderTableRequest.new(name: remote_file_name, format: 'png', index: 0, folder: remote_data_folder)

       result = @words_api.render_table(request)
       assert_equal false, result.nil?
    end
  end
end