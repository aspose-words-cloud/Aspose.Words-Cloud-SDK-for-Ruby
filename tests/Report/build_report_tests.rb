# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="BuildReport_tests.rb">
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
  # Example of how to perform mail merge.
  #
  class BuildReportTests < BaseTestContext
    def remote_data_folder
      remote_test_folder + '/DocumentActions/Reporting'
    end

    def reporting_folder
      'DocumentActions/Reporting'
    end


    #
    # Test for build report online.
    #
    def test_build_report_online
      local_document_file = 'ReportTemplate.docx'
      local_data_file = File.read(File.join(local_test_folder, reporting_folder + '/ReportData.json'))

      request_template = File.open(File.join(local_test_folder, reporting_folder + '/' + local_document_file))
      request_report_engine_settings = ReportEngineSettings.new({:DataSourceType => 'Json', :DataSourceName => 'persons'})
      request = BuildReportOnlineRequest.new(template: request_template, data: local_data_file, report_engine_settings: request_report_engine_settings)

       result = @words_api.build_report_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for build report.
    #
    def test_build_report
      local_document_file = 'ReportTemplate.docx'
      remote_file_name = 'TestBuildReport.docx'
      local_data_file = File.read(File.join(local_test_folder, reporting_folder + '/ReportData.json'))

      upload_file File.join(local_test_folder, reporting_folder + '/' + local_document_file), remote_data_folder + '/' + remote_file_name

      request_report_engine_settings_report_build_options = ['AllowMissingMembers', 'RemoveEmptyParagraphs']
      request_report_engine_settings = ReportEngineSettings.new({:DataSourceType => 'Json', :ReportBuildOptions => request_report_engine_settings_report_build_options})
      request = BuildReportRequest.new(name: remote_file_name, data: local_data_file, report_engine_settings: request_report_engine_settings, folder: remote_data_folder)

       result = @words_api.build_report(request)
       assert_equal false, result.nil?
    end
  end
end