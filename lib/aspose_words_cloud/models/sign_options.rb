# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="sign_options.rb">
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

  # Container class for digital signature options.
  class SignOptions
    # Gets or sets comments on the digital signature. The default value is an empty string.
    attr_accessor :comments


    # Gets or sets the password to decrypt source document. The default value is an empty string.
    attr_accessor :decryption_password


    # Gets or sets the class Guid of the signature cryptography provider. The default value is Empty (all zeroes) Guid.
    attr_accessor :provider_id


    # Gets or sets user defined signature line Guid. The default value is Empty (all zeroes) Guid.
    attr_accessor :signature_line_id


    # Gets or sets the image that will be shown in associated SignatureLine. The default value is an empty string.
    attr_accessor :signature_line_image_filename


    # Gets or sets the date of signing. The default value is current time (Now).
    attr_accessor :sign_time

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'comments' => :'Comments',
        :'decryption_password' => :'DecryptionPassword',
        :'provider_id' => :'ProviderId',
        :'signature_line_id' => :'SignatureLineId',
        :'signature_line_image_filename' => :'SignatureLineImageFilename',
        :'sign_time' => :'SignTime'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'comments' => :'String',
        :'decryption_password' => :'String',
        :'provider_id' => :'String',
        :'signature_line_id' => :'String',
        :'signature_line_image_filename' => :'String',
        :'sign_time' => :'DateTime'
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

      if attributes.key?(:'DecryptionPassword')
        self.decryption_password = attributes[:'DecryptionPassword']
      end

      if attributes.key?(:'ProviderId')
        self.provider_id = attributes[:'ProviderId']
      end

      if attributes.key?(:'SignatureLineId')
        self.signature_line_id = attributes[:'SignatureLineId']
      end

      if attributes.key?(:'SignatureLineImageFilename')
        self.signature_line_image_filename = attributes[:'SignatureLineImageFilename']
      end

      if attributes.key?(:'SignTime')
        self.sign_time = attributes[:'SignTime']
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
          decryption_password == other.decryption_password &&
          provider_id == other.provider_id &&
          signature_line_id == other.signature_line_id &&
          signature_line_image_filename == other.signature_line_image_filename &&
          sign_time == other.sign_time
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [comments, decryption_password, provider_id, signature_line_id, signature_line_image_filename, sign_time].hash
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
    end

  end
end
