# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="compare_options.rb">
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

  # DTO container with compare documents options.
  class CompareOptions
    # Gets or sets whether accept revisions before comparison or not.
    attr_accessor :accept_all_revisions_before_comparison


    # Gets or sets the option indicating whether changes are tracked by character or by word.
    attr_reader :granularity


    # Gets or sets a value indicating whether documents comparison is case insensitive. By default comparison is case sensitive.
    attr_accessor :ignore_case_changes


    # Gets or sets a value indicating whether comments content is ignored. By default comments are not ignored.
    attr_accessor :ignore_comments


    # Gets or sets a value indicating whether fields content is ignored. By default fields are not ignored.
    attr_accessor :ignore_fields


    # Gets or sets a value indicating whether footnotes/endnotes content is ignored. By default footnotes/endnotes are not ignored.
    attr_accessor :ignore_footnotes


    # Gets or sets a value indicating whether formatting is ignored. By default document formatting is not ignored.
    attr_accessor :ignore_formatting


    # Gets or sets a value indicating whether headers and footers content is ignored. By default headers and footers are not ignored.
    attr_accessor :ignore_headers_and_footers


    # Gets or sets a value indicating whether tables content is ignored. By default tables are not ignored.
    attr_accessor :ignore_tables


    # Gets or sets a value indicating whether textboxes content is ignored. By default textboxes are not ignored.
    attr_accessor :ignore_textboxes


    # Gets or sets the option that controls which document shall be used as a target during comparison.
    attr_reader :target


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
        :'accept_all_revisions_before_comparison' => :'AcceptAllRevisionsBeforeComparison',
        :'granularity' => :'Granularity',
        :'ignore_case_changes' => :'IgnoreCaseChanges',
        :'ignore_comments' => :'IgnoreComments',
        :'ignore_fields' => :'IgnoreFields',
        :'ignore_footnotes' => :'IgnoreFootnotes',
        :'ignore_formatting' => :'IgnoreFormatting',
        :'ignore_headers_and_footers' => :'IgnoreHeadersAndFooters',
        :'ignore_tables' => :'IgnoreTables',
        :'ignore_textboxes' => :'IgnoreTextboxes',
        :'target' => :'Target'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'accept_all_revisions_before_comparison' => :'BOOLEAN',
        :'granularity' => :'String',
        :'ignore_case_changes' => :'BOOLEAN',
        :'ignore_comments' => :'BOOLEAN',
        :'ignore_fields' => :'BOOLEAN',
        :'ignore_footnotes' => :'BOOLEAN',
        :'ignore_formatting' => :'BOOLEAN',
        :'ignore_headers_and_footers' => :'BOOLEAN',
        :'ignore_tables' => :'BOOLEAN',
        :'ignore_textboxes' => :'BOOLEAN',
        :'target' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.key?(:'AcceptAllRevisionsBeforeComparison')
        self.accept_all_revisions_before_comparison = attributes[:'AcceptAllRevisionsBeforeComparison']
      end

      if attributes.key?(:'Granularity')
        self.granularity = attributes[:'Granularity']
      end

      if attributes.key?(:'IgnoreCaseChanges')
        self.ignore_case_changes = attributes[:'IgnoreCaseChanges']
      end

      if attributes.key?(:'IgnoreComments')
        self.ignore_comments = attributes[:'IgnoreComments']
      end

      if attributes.key?(:'IgnoreFields')
        self.ignore_fields = attributes[:'IgnoreFields']
      end

      if attributes.key?(:'IgnoreFootnotes')
        self.ignore_footnotes = attributes[:'IgnoreFootnotes']
      end

      if attributes.key?(:'IgnoreFormatting')
        self.ignore_formatting = attributes[:'IgnoreFormatting']
      end

      if attributes.key?(:'IgnoreHeadersAndFooters')
        self.ignore_headers_and_footers = attributes[:'IgnoreHeadersAndFooters']
      end

      if attributes.key?(:'IgnoreTables')
        self.ignore_tables = attributes[:'IgnoreTables']
      end

      if attributes.key?(:'IgnoreTextboxes')
        self.ignore_textboxes = attributes[:'IgnoreTextboxes']
      end

      if attributes.key?(:'Target')
        self.target = attributes[:'Target']
      end
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      granularity_validator = EnumAttributeValidator.new('String', ["CharLevel", "WordLevel"])
      return false unless granularity_validator.valid?(@granularity)
      target_validator = EnumAttributeValidator.new('String', ["Current", "New"])
      return false unless target_validator.valid?(@target)

      return true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] granularity Object to be assigned
    def granularity=(granularity)
      validator = EnumAttributeValidator.new('String', ["CharLevel", "WordLevel"])
      if granularity.to_i == 0
        unless validator.valid?(granularity)
          raise ArgumentError, "invalid value for 'granularity', must be one of #{validator.allowable_values}."
        end
        @granularity = granularity
      else
        @granularity = validator.allowable_values[granularity.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] target Object to be assigned
    def target=(target)
      validator = EnumAttributeValidator.new('String', ["Current", "New"])
      if target.to_i == 0
        unless validator.valid?(target)
          raise ArgumentError, "invalid value for 'target', must be one of #{validator.allowable_values}."
        end
        @target = target
      else
        @target = validator.allowable_values[target.to_i]
      end
    end


    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(other)
      return true if self.equal?(other)
      self.class == other.class &&
          accept_all_revisions_before_comparison == other.accept_all_revisions_before_comparison &&
          granularity == other.granularity &&
          ignore_case_changes == other.ignore_case_changes &&
          ignore_comments == other.ignore_comments &&
          ignore_fields == other.ignore_fields &&
          ignore_footnotes == other.ignore_footnotes &&
          ignore_formatting == other.ignore_formatting &&
          ignore_headers_and_footers == other.ignore_headers_and_footers &&
          ignore_tables == other.ignore_tables &&
          ignore_textboxes == other.ignore_textboxes &&
          target == other.target
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [accept_all_revisions_before_comparison, granularity, ignore_case_changes, ignore_comments, ignore_fields, ignore_footnotes, ignore_formatting, ignore_headers_and_footers, ignore_tables, ignore_textboxes, target].hash
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
