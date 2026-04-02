# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="Range_tests.rb">
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
  # Example of how to work with ranges.
  #
  class RangeTests < BaseTestContext
    def remote_data_folder
      remote_test_folder + '/DocumentElements/Range'
    end

    def local_file
      'DocumentElements/Range/RangeGet.doc'
    end


    #
    # Test for getting the text from range.
    #
    def test_get_range_text
      remote_file_name = 'TestGetRangeText.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetRangeTextRequest.new(name: remote_file_name, range_start_identifier: 'id0.0.0', range_end_identifier: 'id0.0.1', folder: remote_data_folder)

       result = @words_api.get_range_text(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting the text from range online.
    #
    def test_get_range_text_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetRangeTextOnlineRequest.new(document: request_document, range_start_identifier: 'id0.0.0', range_end_identifier: 'id0.0.1')

       result = @words_api.get_range_text_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for removing the text for range.
    #
    def test_remove_range
      remote_file_name = 'TestRemoveRange.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = RemoveRangeRequest.new(name: remote_file_name, range_start_identifier: 'id0.0.0', range_end_identifier: 'id0.0.1', folder: remote_data_folder)

       result = @words_api.remove_range(request)
       assert_equal false, result.nil?
    end

    #
    # Test for removing the text for range online.
    #
    def test_remove_range_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = RemoveRangeOnlineRequest.new(document: request_document, range_start_identifier: 'id0.0.0', range_end_identifier: 'id0.0.1')

       result = @words_api.remove_range_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for saving a range as a new document.
    #
    def test_save_as_range
      remote_file_name = 'TestSaveAsRange.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_document_parameters = RangeDocument.new({:DocumentName => remote_data_folder + '/NewDoc.docx'})
      request = SaveAsRangeRequest.new(name: remote_file_name, range_start_identifier: 'id0.0.0', document_parameters: request_document_parameters, range_end_identifier: 'id0.0.1', folder: remote_data_folder)

       result = @words_api.save_as_range(request)
       assert_equal false, result.nil?
    end

    #
    # Test for saving a range as a new document online.
    #
    def test_save_as_range_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_document_parameters = RangeDocument.new({:DocumentName => remote_data_folder + '/NewDoc.docx'})
      request = SaveAsRangeOnlineRequest.new(document: request_document, range_start_identifier: 'id0.0.0', document_parameters: request_document_parameters, range_end_identifier: 'id0.0.1')

       result = @words_api.save_as_range_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for replacing text in range.
    #
    def test_replace_with_text
      remote_file_name = 'TestReplaceWithText.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request_range_text = ReplaceRange.new({:Text => 'Replaced header'})
      request = ReplaceWithTextRequest.new(name: remote_file_name, range_start_identifier: 'id0.0.0', range_text: request_range_text, range_end_identifier: 'id0.0.1', folder: remote_data_folder)

       result = @words_api.replace_with_text(request)
       assert_equal false, result.nil?
    end

    #
    # Test for replacing text in range online.
    #
    def test_replace_with_text_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request_range_text = ReplaceRange.new({:Text => 'Replaced header'})
      request = ReplaceWithTextOnlineRequest.new(document: request_document, range_start_identifier: 'id0.0.0', range_text: request_range_text, range_end_identifier: 'id0.0.1')

       result = @words_api.replace_with_text_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test to translate node id to node path.
    #
    def test_translate_node_id
      remote_file_name = 'TestTranslateNodeId.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = TranslateNodeIdRequest.new(name: remote_file_name, node_id: 'id0.0.0', folder: remote_data_folder)

       result = @words_api.translate_node_id(request)
       assert_equal false, result.nil?
    end

    #
    # Test to translate node id to node path online.
    #
    def test_translate_node_id_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = TranslateNodeIdOnlineRequest.new(document: request_document, node_id: 'id0.0.0')

       result = @words_api.translate_node_id_online(request)
       assert_equal false, result.nil?
    end
  end
end