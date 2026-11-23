# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="json_data_load_options.rb">
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

  # Represents options for parsing JSON data.
  # An instance of this class can be passed into constructors of Aspose.Words.Reporting.JsonDataSource.
  class JsonDataLoadOptions
    # Gets or sets a value indicating whether a generated data source will always contain
    # an object for a JSON root element. If a JSON root element contains a single complex
    # property, such an object is not created by default.
    # The default value is false.
    attr_accessor :always_generate_root_object


    # Gets or sets exact formats for parsing JSON date-time values while loading JSON.
    # The default is null.
    # Strings encoded using Microsoft® JSON date-time format (for example, "/Date(1224043200000)/")
    # are always recognized as date-time values regardless of a value of this property.
    # The property defines additional formats to be used while parsing date-time values
    # from strings in the following way:
    # • When Aspose.Words.Reporting.JsonDataLoadOptions.ExactDateTimeParseFormats is
    # null, the ISO-8601 format and all date-time formats supported for the current,
    # English USA, and English New Zealand cultures are used additionally in the mentioned
    # order.
    # • When Aspose.Words.Reporting.JsonDataLoadOptions.ExactDateTimeParseFormats contains
    # strings, they are used as additional date-time formats utilizing the current
    # culture.
    # • When Aspose.Words.Reporting.JsonDataLoadOptions.ExactDateTimeParseFormats is
    # empty, no additional date-time formats are used.
    attr_accessor :exact_date_time_parse_formats


    # Gets or sets a mode for parsing JSON simple values (null, boolean, number, integer,
    # and string) while loading JSON. Such a mode does not affect parsing of date-time
    # values. The default is Aspose.Words.Reporting.JsonSimpleValueParseMode.Loose.
    attr_reader :simple_value_parse_mode


    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'always_generate_root_object' => :'AlwaysGenerateRootObject',
        :'exact_date_time_parse_formats' => :'ExactDateTimeParseFormats',
        :'simple_value_parse_mode' => :'SimpleValueParseMode'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'always_generate_root_object' => :'BOOLEAN',
        :'exact_date_time_parse_formats' => :'Array<String>',
        :'simple_value_parse_mode' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.key?(:'AlwaysGenerateRootObject')
        self.always_generate_root_object = attributes[:'AlwaysGenerateRootObject']
      end

      if attributes.key?(:'ExactDateTimeParseFormats')
        if (value = attributes[:'ExactDateTimeParseFormats']).is_a?(Array)
          self.exact_date_time_parse_formats = value
        end
      end

      if attributes.key?(:'SimpleValueParseMode')
        self.simple_value_parse_mode = attributes[:'SimpleValueParseMode']
      end
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      simple_value_parse_mode_validator = EnumAttributeValidator.new('String', ["Loose", "Strict"])
      return false unless simple_value_parse_mode_validator.valid?(@simple_value_parse_mode)

      return true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] simple_value_parse_mode Object to be assigned
    def simple_value_parse_mode=(simple_value_parse_mode)
      validator = EnumAttributeValidator.new('String', ["Loose", "Strict"])
      if simple_value_parse_mode.to_i == 0
        unless validator.valid?(simple_value_parse_mode)
          raise ArgumentError, "invalid value for 'simple_value_parse_mode', must be one of #{validator.allowable_values}."
        end
        @simple_value_parse_mode = simple_value_parse_mode
      else
        @simple_value_parse_mode = validator.allowable_values[simple_value_parse_mode.to_i]
      end
    end


    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(other)
      return true if self.equal?(other)
      self.class == other.class &&
          always_generate_root_object == other.always_generate_root_object &&
          exact_date_time_parse_formats == other.exact_date_time_parse_formats &&
          simple_value_parse_mode == other.simple_value_parse_mode
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [always_generate_root_object, exact_date_time_parse_formats, simple_value_parse_mode].hash
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
      raise ArgumentError, 'Property always_generate_root_object in JsonDataLoadOptions is required.' if self.always_generate_root_object.nil?
      raise ArgumentError, 'Property simple_value_parse_mode in JsonDataLoadOptions is required.' if self.simple_value_parse_mode.nil?
    end

  end
end
