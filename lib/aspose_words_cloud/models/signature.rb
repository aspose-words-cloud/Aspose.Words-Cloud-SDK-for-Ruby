# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="signature.rb">
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

require 'date'

module AsposeWordsCloud

  # The REST response with a document signature collection.
  # This response is returned by the Service when handling any "https://api.aspose.cloud/v4.0/words/Test.doc/signatures" REST API requests.
  class Signature
    # Gets or sets the signing purpose comment.
    attr_accessor :comments


    # Gets or sets the subject distinguished name of the certificate issuer.
    attr_accessor :issuer_name


    # Gets or sets a value indicating whether this digital signature is valid.
    attr_accessor :is_valid


    # Gets or sets the type of the digital signature.
    attr_accessor :signature_type


    # Gets or sets an array of bytes representing a signature value as base64 string.
    attr_accessor :signature_value


    # Gets or sets the time the document was signed.
    attr_accessor :sign_time


    # Gets or sets the subject distinguished name of the certificate that was used to sign the document.
    attr_accessor :subject_name

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'comments' => :'Comments',
        :'issuer_name' => :'IssuerName',
        :'is_valid' => :'IsValid',
        :'signature_type' => :'SignatureType',
        :'signature_value' => :'SignatureValue',
        :'sign_time' => :'SignTime',
        :'subject_name' => :'SubjectName'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'comments' => :'String',
        :'issuer_name' => :'String',
        :'is_valid' => :'BOOLEAN',
        :'signature_type' => :'String',
        :'signature_value' => :'String',
        :'sign_time' => :'DateTime',
        :'subject_name' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.key?(:'Comments')
        self.comments = attributes[:'Comments']
      end

      if attributes.key?(:'IssuerName')
        self.issuer_name = attributes[:'IssuerName']
      end

      if attributes.key?(:'IsValid')
        self.is_valid = attributes[:'IsValid']
      end

      if attributes.key?(:'SignatureType')
        self.signature_type = attributes[:'SignatureType']
      end

      if attributes.key?(:'SignatureValue')
        self.signature_value = attributes[:'SignatureValue']
      end

      if attributes.key?(:'SignTime')
        self.sign_time = attributes[:'SignTime']
      end

      if attributes.key?(:'SubjectName')
        self.subject_name = attributes[:'SubjectName']
      end
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(other)
      return true if self.equal?(other)
      self.class == other.class &&
          comments == other.comments &&
          issuer_name == other.issuer_name &&
          is_valid == other.is_valid &&
          signature_type == other.signature_type &&
          signature_value == other.signature_value &&
          sign_time == other.sign_time &&
          subject_name == other.subject_name
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [comments, issuer_name, is_valid, signature_type, signature_value, sign_time, subject_name].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end
        # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        Time.at(/\d/.match(value)[0].to_f).to_datetime
      when :Date
        Time.at(/\d/.match(value)[0].to_f).to_date
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else
      # model
        if value[:'$type']
            type = value[:'$type'][0..-4]
        end

        temp_model = AsposeWordsCloud.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

    def collectFilesContent(resultFilesContent)
    end

    def validate()
      raise ArgumentError, 'Property is_valid in Signature is required.' if self.is_valid.nil?
      raise ArgumentError, 'Property sign_time in Signature is required.' if self.sign_time.nil?
    end

  end
end
