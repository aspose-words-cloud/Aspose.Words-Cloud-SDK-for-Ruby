# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="Section_tests.rb">
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
  # Example of how to work with sections.
  #
  class SectionTests < BaseTestContext
    def remote_data_folder
      remote_test_folder + '/DocumentElements/Section'
    end

    def local_file
      'Common/test_multi_pages.docx'
    end


    #
    # Test for getting section by index.
    #
    def test_get_section
      remote_file_name = 'TestGetSection.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetSectionRequest.new(name: remote_file_name, section_index: 0, folder: remote_data_folder)

       result = @words_api.get_section(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting section by index online.
    #
    def test_get_section_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetSectionOnlineRequest.new(document: request_document, section_index: 0)

       result = @words_api.get_section_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting sections.
    #
    def test_get_sections
      remote_file_name = 'TestGetSections.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = GetSectionsRequest.new(name: remote_file_name, folder: remote_data_folder)

       result = @words_api.get_sections(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting sections online.
    #
    def test_get_sections_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = GetSectionsOnlineRequest.new(document: request_document)

       result = @words_api.get_sections_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for delete a section.
    #
    def test_delete_section
      remote_file_name = 'TestDeleteSection.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = DeleteSectionRequest.new(name: remote_file_name, section_index: 0, folder: remote_data_folder)

       @words_api.delete_section(request)
    end

    #
    # Test for delete a section online.
    #
    def test_delete_section_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = DeleteSectionOnlineRequest.new(document: request_document, section_index: 0)

       result = @words_api.delete_section_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for merge a section with the next one.
    #
    def test_merge_with_next
      remote_file_name = 'TestMergeWithNext.docx'

      upload_file File.join(local_test_folder, 'DocumentElements/Sections/Source.docx'), remote_data_folder + '/' + remote_file_name

      request = MergeWithNextRequest.new(name: remote_file_name, section_index: 0, folder: remote_data_folder)

       @words_api.merge_with_next(request)
    end

    #
    # Test for merge a section with the next one online.
    #
    def test_merge_with_next_online
      request_document = File.open(File.join(local_test_folder, 'DocumentElements/Sections/Source.docx'))
      request = MergeWithNextOnlineRequest.new(document: request_document, section_index: 0)

       result = @words_api.merge_with_next_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for insertion a section.
    #
    def test_insert_section
      remote_file_name = 'TestInsertSection.docx'

      upload_file File.join(local_test_folder, local_file), remote_data_folder + '/' + remote_file_name

      request = InsertSectionRequest.new(name: remote_file_name, section_index: 0, folder: remote_data_folder)

       @words_api.insert_section(request)
    end

    #
    # Test for insertion a section online.
    #
    def test_insert_section_online
      request_document = File.open(File.join(local_test_folder, local_file))
      request = InsertSectionOnlineRequest.new(document: request_document, section_index: 0)

       result = @words_api.insert_section_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for linking headers and footers to previous section.
    #
    def test_link_header_footers_to_previous
      remote_file_name = 'TestLinkHeaderFootersToPrevious.docx'

      upload_file File.join(local_test_folder, 'DocumentElements/Sections/Source.docx'), remote_data_folder + '/' + remote_file_name

      request = LinkHeaderFootersToPreviousRequest.new(name: remote_file_name, section_index: 1, folder: remote_data_folder)

       @words_api.link_header_footers_to_previous(request)
    end
  end
end