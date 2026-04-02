# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="Signature_tests.rb">
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
  # Example of how to work with signatures.
  #
  class SignatureTests < BaseTestContext
    def remote_folder
      remote_test_folder + '/DocumentActions/Signature'
    end

    def local_folder
      'DocumentActions/Signature'
    end

    def signed_document
      'signedDocument.docx'
    end

    def unsigned_document
      'unsignedDocument.docx'
    end

    def certificate_name
      'morzal.pfx'
    end

    def certificate_password
      'aw'
    end


    #
    # Test for getting all document signatures.
    #
    def test_get_signatures
      remote_name = 'TestGetSignatures.docx'

      upload_file File.join(local_test_folder, local_folder + '/' + signed_document), remote_folder + '/' + remote_name

      request = GetSignaturesRequest.new(name: remote_name, folder: remote_folder)

       result = @words_api.get_signatures(request)
       assert_equal false, result.nil?
    end

    #
    # Test for getting all document signatures online.
    #
    def test_get_signatures_online
      request_document = File.open(File.join(local_test_folder, local_folder + '/' + signed_document))
      request = GetSignaturesOnlineRequest.new(document: request_document)

       result = @words_api.get_signatures_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for removing all document signatures.
    #
    def test_remove_all_signatures
      remote_name = 'TestRemoveAllSignatures.docx'

      upload_file File.join(local_test_folder, local_folder + '/' + signed_document), remote_folder + '/' + remote_name

      request = RemoveAllSignaturesRequest.new(name: remote_name, folder: remote_folder)

       result = @words_api.remove_all_signatures(request)
       assert_equal false, result.nil?
    end

    #
    # Test for removing all document signatures online.
    #
    def test_remove_all_signatures_online
      request_document = File.open(File.join(local_test_folder, local_folder + '/' + signed_document))
      request = RemoveAllSignaturesOnlineRequest.new(document: request_document)

       result = @words_api.remove_all_signatures_online(request)
       assert_equal false, result.nil?
    end

    #
    # Test for signing document.
    #
    def test_sign_document
      remote_name = 'TestSignDocument.docx'
      remote_certificate_name = 'TestCertificate.pfx'

      upload_file File.join(local_test_folder, local_folder + '/' + unsigned_document), remote_folder + '/' + remote_name
      upload_file File.join(local_test_folder, local_folder + '/' + certificate_name), remote_folder + '/' + remote_certificate_name

      request = SignDocumentRequest.new(name: remote_name, certificate_path: remote_folder + '/' + remote_certificate_name, certificate_password: certificate_password, folder: remote_folder)

       result = @words_api.sign_document(request)
       assert_equal false, result.nil?
    end

    #
    # Test for signing document online.
    #
    def test_sign_document_online
      remote_certificate_name = 'TestCertificateOnline.pfx'

      upload_file File.join(local_test_folder, local_folder + '/' + certificate_name), remote_folder + '/' + remote_certificate_name

      request_document = File.open(File.join(local_test_folder, local_folder + '/' + unsigned_document))
      request = SignDocumentOnlineRequest.new(document: request_document, certificate_path: remote_folder + '/' + remote_certificate_name, certificate_password: certificate_password)

       result = @words_api.sign_document_online(request)
       assert_equal false, result.nil?
    end
  end
end