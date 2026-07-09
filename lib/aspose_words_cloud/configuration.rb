# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="configuration.rb">
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

require 'uri'

module AsposeWordsCloud
  #
  # Class for storing API configuration info
  #
  class Configuration
    # Defines base url
    attr_accessor :baseUrl

    # Defines API keys used with API Key authentications.
    #
    # @return [Hash] key: parameter name, value: parameter value (API key)
    #
    # @example parameter name is "ClientSecret", client secret is "xxx" (e.g. "ClientSecret=xxx" in query string)
    #   config.client_data['ClientSecret'] = 'xxx'
    attr_accessor :client_data

    # Defines API key prefixes used with API Key authentications.
    #
    # @return [Hash] key: parameter name, value: API key prefix
    #
    # @example parameter name is "Authorization", API key prefix is "Token" (e.g. "Authorization: Token xxx" in headers)
    #   config.client_data_prefix['client_secret'] = 'Token'
    attr_accessor :client_data_prefix

    # Defines the username used with HTTP basic authentication.
    #
    # @return [String]
    attr_accessor :username

    # Defines the password used with HTTP basic authentication.
    #
    # @return [String]
    attr_accessor :password

    # Defines the access token (Bearer) used with OAuth2.
    attr_accessor :access_token

	# Defines the refresh token (Bearer) used with OAuth2.
    attr_accessor :refresh_token

    # Set this to enable/disable debugging. When enabled (set to true), HTTP request/response
    # details will be logged with `logger.debug` (see the `logger` attribute).
    # Default to false.
    #
    # @return [true, false]
    attr_accessor :debugging

    # Defines the logger used for debugging.
    # Default to `Rails.logger` (when in Rails) or logging to STDOUT.
    #
    # @return [#debug]
    attr_accessor :logger

    # Defines the temporary folder to store downloaded files
    # (for API endpoints that have file response).
    # Default to use `Tempfile`.
    #
    # @return [String]
    attr_accessor :temp_folder_path

    # Set this to false to skip client side validation in the operation.
    # Default to true.
    # @return [true, false]
    attr_accessor :client_side_validation

    # Defines RSA key data
    attr_accessor :exponent
    attr_accessor :modulus

    # Defines encryptor
    attr_accessor :encryptor

    # Defines request timeout
    attr_accessor :timeout

    def initialize
      @baseUrl = "https://api.aspose.cloud"
      @api_version = "/v4.0/"
      @client_data = {}
      @client_data_prefix = {}
      @client_side_validation = true
      @debugging = false
      @logger = defined?(Rails) ? Rails.logger : Logger.new(STDOUT)
      @timeout = 300

      yield(self) if block_given?
    end

    # The default Configuration object.
    def self.default
      @@default ||= Configuration.new
    end

    # yield self
    def configure
      yield(self) if block_given?
    end

    # returns base url
    def getFullUrl(path, withoutVersion)
      if withoutVersion
        return URI.join(baseUrl, path).to_s
      end

      p = URI::Parser.new
      URI.join(baseUrl, "/v4.0/", p.escape(path)).to_s
    end

    # Gets API key (with prefix if set).
    # @param [String] param_name the parameter name of API key auth
    def client_data_with_prefix(param_name)
      if @client_data_prefix[param_name]
        "#{@client_data_prefix[param_name]} #{@client_data[param_name]}"
      else
        @client_data[param_name]
      end
    end

    # Gets Basic Auth token string
    def basic_auth_token
      'Basic ' + ["#{username}:#{password}"].pack('m').delete("\r\n")
    end

    # Returns Auth Settings hash for api client.
    def auth_settings
      {
        'JWT' =>
          {
            type: 'oauth2',
            in: 'header',
            key: 'Authorization',
            value: "Bearer #{access_token}"
          },
      }
    end
  end
end
