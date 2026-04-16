# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="ConvertDocument_tests.rb">
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
  # Example of how to convert document to one of the available formats.
  #
  class ConvertDocumentTests < BaseTestContext
    def remote_folder
      remote_test_folder + '/DocumentActions/ConvertDocument'
    end

    def local_folder
      'DocumentActions/ConvertDocument'
    end


    #
    # Test for converting document to one of the available formats.
    #
    def test_save_as
      local_name = 'test_multi_pages.docx'
      remote_name = 'TestSaveAs.docx'

      upload_file File.join(local_test_folder, 'Common/' + local_name), remote_folder + '/' + remote_name

      request_save_options_data = PdfSaveOptionsData.new({:FileName => remote_test_out + '/TestSaveAs.pdf'})
      request = SaveAsRequest.new(name: remote_name, save_options_data: request_save_options_data, folder: remote_folder)

       result = @words_api.save_as(request)
       assert_equal false, result.nil?
    end

    #
    # Test for converting document online to one of the available formats.
    #
    def test_save_as_online
      local_name = 'test_multi_pages.docx'

      request_document = File.open(File.join(local_test_folder, 'Common/' + local_name))
      request_save_options_data = PdfSaveOptionsData.new({:FileName => remote_test_out + '/TestSaveAs.pdf'})
      request = SaveAsOnlineRequest.new(document: request_document, save_options_data: request_save_options_data)

       result = @words_api.save_as_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for converting document online to html with additional files like css and images.
    #
    def test_save_as_online_html_multifile
      local_name = 'test_multi_pages.docx'

      request_document = File.open(File.join(local_test_folder, 'Common/' + local_name))
      request_save_options_data = HtmlSaveOptionsData.new({:FileName => remote_test_out + '/TestSaveAsHtml.html', :CssStyleSheetType => 'External', :CssStyleSheetFileName => remote_test_out + '/TestSaveAsHtml.css'})
      request = SaveAsOnlineRequest.new(document: request_document, save_options_data: request_save_options_data)

       result = @words_api.save_as_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for converting document to one of the available formats.
    #
    def test_save_as_docx
      local_name = '45.pdf'
      remote_name = 'TestSaveAsFromPdfToDoc.pdf'

      upload_file File.join(local_test_folder, local_folder + '/' + local_name), remote_folder + '/' + remote_name

      request_save_options_data = DocxSaveOptionsData.new({:FileName => remote_test_out + '/TestSaveAsFromPdfToDoc.docx'})
      request = SaveAsRequest.new(name: remote_name, save_options_data: request_save_options_data, folder: remote_folder)

       result = @words_api.save_as(request)
       assert_equal false, result.nil?
    end

    #
    # Test for converting document to one of the available formats.
    #
    def test_save_as_tiff
      local_name = 'test_multi_pages.docx'
      remote_name = 'TestSaveAsTiff.pdf'

      upload_file File.join(local_test_folder, 'Common/' + local_name), remote_folder + '/' + remote_name

      request_save_options = TiffSaveOptionsData.new({:FileName => remote_test_out + '/abc.tiff'})
      request = SaveAsTiffRequest.new(name: remote_name, save_options: request_save_options, folder: remote_folder)

       result = @words_api.save_as_tiff(request)
       assert_equal false, result.nil?
    end

    #
    # Test for converting document to one of the available formats.
    #
    def test_save_as_tiff_online
      local_name = 'test_multi_pages.docx'

      request_document = File.open(File.join(local_test_folder, 'Common/' + local_name))
      request_save_options = TiffSaveOptionsData.new({:FileName => remote_test_out + '/abc.tiff'})
      request = SaveAsTiffOnlineRequest.new(document: request_document, save_options: request_save_options)

       result = @words_api.save_as_tiff_online(request)
       assert_equal false, result.nil?
    end

    #
    # A test for ConvertDocument.
    #
    def test_convert_document
      request_document = File.open(File.join(local_test_folder, local_folder + '/test_uploadfile.docx'))
      request = ConvertDocumentRequest.new(document: request_document, format: 'pdf')

       result = @words_api.convert_document(request)
       assert_equal false, result.nil?
    end

    #
    # A test for ConvertDocument as a job.
    #
    def test_convert_document_job
      request_document = File.open(File.join(local_test_folder, local_folder + '/test_uploadfile.docx'))
      request = ConvertDocumentJobRequest.new(document: request_document, format: 'pdf')

      job_handler = @words_api.convert_document_job(request)
      assert_equal false, job_handler.nil?
    job_handler.wait_result
    end
  end
end