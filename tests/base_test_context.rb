# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="base_test_context.rb">
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
  require "minitest/autorun"
  require "minitest/reporters"
  Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new, Minitest::Reporters::JUnitReporter.new('testReports/report')]
  require 'securerandom'
  require_relative '../lib/aspose_words_cloud'
  class BaseTestContext < Minitest::Test
    include Minitest::Assertions
    def setup
      creds = get_config()
      AsposeWordsCloud.configure do |config|
        config.client_data['ClientId'] = creds['ClientId']
        config.client_data['ClientSecret'] = creds['ClientSecret']
        config.debugging = creds['Debug']
        config.baseUrl = creds['BaseUrl']
      end
      @words_api = WordsApi.new
    end

    def get_config()
      creds_file = 'Settings/servercreds.json'
      raise ArgumentError, 'Put your credentials into servercreds.json' unless File.exist? creds_file
      file = File.read(creds_file)
      creds = JSON.parse(file)

      return creds
    end

    def upload_file(file_path, remote_path)
      request = UploadFileRequest.new(file_content: File.new(file_path, 'rb'), path: remote_path)
      @words_api.upload_file request
    end

    def debug(str)
      @words_api.api_client.config.logger.debug str
    end

    def generate_uuid
      SecureRandom.uuid
    end

    def local_test_folder
      'TestData'
    end

    def remote_test_folder
      'Temp/SdkTests/ruby'
    end

    def remote_test_out
      'Temp/SdkTests/ruby/TestOut'
    end

    def local_common_folder
      'TestData/Common'
    end

    def exists?(folder, name)
      request = GetFilesListRequest.new folder
      result = @words_api.get_files_list request
      !result.value.find{|f| f.name == name}.nil?
    end
  end
end
