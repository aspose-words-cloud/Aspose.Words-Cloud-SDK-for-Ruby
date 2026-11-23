# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="list_level.rb">
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

  # DTO container with a document list level.
  class ListLevel
    # Gets or sets the link to the document.
    attr_accessor :link


    # Gets or sets the starting number for this list level.
    # The default value is 1.
    attr_accessor :start_at


    # Gets or sets the number style for this list level.
    attr_reader :number_style


    # Gets or sets the number format for the list level.
    # Among normal text characters, the string can contain placeholder characters \\x0000 to \\x0008 representing the numbers from the corresponding list levels. For example, the string "\\x0000.\\x0001)" will generate a list label that looks something like "1.5)". The number "1" is the current number from the 1st list level, the number "5" is the current number from the 2nd list level. Null is not allowed, but an empty string meaning no number is valid.
    attr_accessor :number_format


    # Gets or sets the justification of the actual number of the list item.
    # The list label is justified relative to the Aspose.Words.Lists.ListLevel.NumberPosition property.
    attr_reader :alignment


    # Gets or sets a value indicating whether the level turns all inherited numbers to Arabic, false if it preserves their number style.
    attr_accessor :is_legal


    # Gets or sets the list level, that must appear before the specified list level restarts numbering.
    # The value of -1 means the numbering will continue.
    attr_accessor :restart_after_level


    # Gets or sets the character inserted after the number for the list level.
    attr_reader :trailing_character


    # Gets or sets character formatting used for the list label.
    attr_accessor :font


    # Gets or sets the tab position (in points) for the list level.
    # Has effect only when Aspose.Words.Lists.ListLevel.TrailingCharacter is a tab.
    # Aspose.Words.Lists.ListLevel.NumberPosition Aspose.Words.Lists.ListLevel.TextPosition.
    attr_accessor :tab_position


    # Gets or sets the position (in points) of the number or bullet for the list level.
    # Aspose.Words.Lists.ListLevel.NumberPosition corresponds to LeftIndent plus FirstLineIndent of the paragraph. Aspose.Words.Lists.ListLevel.TextPosition Aspose.Words.Lists.ListLevel.TabPosition.
    attr_accessor :number_position


    # Gets or sets the position (in points) for the second line of wrapping text for the list level.
    # Aspose.Words.Lists.ListLevel.TextPosition corresponds to LeftIndent of the paragraph.
    # Aspose.Words.Lists.ListLevel.NumberPosition Aspose.Words.Lists.ListLevel.TabPosition.
    attr_accessor :text_position


    # Gets or sets the paragraph style that is linked to this list level.
    # This property is null when the list level is not linked to a paragraph style.
    # This property can be set to null.
    attr_accessor :linked_style


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
        :'link' => :'Link',
        :'start_at' => :'StartAt',
        :'number_style' => :'NumberStyle',
        :'number_format' => :'NumberFormat',
        :'alignment' => :'Alignment',
        :'is_legal' => :'IsLegal',
        :'restart_after_level' => :'RestartAfterLevel',
        :'trailing_character' => :'TrailingCharacter',
        :'font' => :'Font',
        :'tab_position' => :'TabPosition',
        :'number_position' => :'NumberPosition',
        :'text_position' => :'TextPosition',
        :'linked_style' => :'LinkedStyle'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'link' => :'WordsApiLink',
        :'start_at' => :'Integer',
        :'number_style' => :'String',
        :'number_format' => :'String',
        :'alignment' => :'String',
        :'is_legal' => :'BOOLEAN',
        :'restart_after_level' => :'Integer',
        :'trailing_character' => :'String',
        :'font' => :'Font',
        :'tab_position' => :'Float',
        :'number_position' => :'Float',
        :'text_position' => :'Float',
        :'linked_style' => :'Style'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.key?(:'Link')
        self.link = attributes[:'Link']
      end

      if attributes.key?(:'StartAt')
        self.start_at = attributes[:'StartAt']
      end

      if attributes.key?(:'NumberStyle')
        self.number_style = attributes[:'NumberStyle']
      end

      if attributes.key?(:'NumberFormat')
        self.number_format = attributes[:'NumberFormat']
      end

      if attributes.key?(:'Alignment')
        self.alignment = attributes[:'Alignment']
      end

      if attributes.key?(:'IsLegal')
        self.is_legal = attributes[:'IsLegal']
      end

      if attributes.key?(:'RestartAfterLevel')
        self.restart_after_level = attributes[:'RestartAfterLevel']
      end

      if attributes.key?(:'TrailingCharacter')
        self.trailing_character = attributes[:'TrailingCharacter']
      end

      if attributes.key?(:'Font')
        self.font = attributes[:'Font']
      end

      if attributes.key?(:'TabPosition')
        self.tab_position = attributes[:'TabPosition']
      end

      if attributes.key?(:'NumberPosition')
        self.number_position = attributes[:'NumberPosition']
      end

      if attributes.key?(:'TextPosition')
        self.text_position = attributes[:'TextPosition']
      end

      if attributes.key?(:'LinkedStyle')
        self.linked_style = attributes[:'LinkedStyle']
      end
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      number_style_validator = EnumAttributeValidator.new('String', ["Arabic", "UppercaseRoman", "LowercaseRoman", "UppercaseLetter", "LowercaseLetter", "Ordinal", "Number", "OrdinalText", "Hex", "ChicagoManual", "Kanji", "KanjiDigit", "AiueoHalfWidth", "IrohaHalfWidth", "ArabicFullWidth", "ArabicHalfWidth", "KanjiTraditional", "KanjiTraditional2", "NumberInCircle", "DecimalFullWidth", "Aiueo", "Iroha", "LeadingZero", "Bullet", "Ganada", "Chosung", "GB1", "GB2", "GB3", "GB4", "Zodiac1", "Zodiac2", "Zodiac3", "TradChinNum1", "TradChinNum2", "TradChinNum3", "TradChinNum4", "SimpChinNum1", "SimpChinNum2", "SimpChinNum3", "SimpChinNum4", "HanjaRead", "HanjaReadDigit", "Hangul", "Hanja", "Hebrew1", "Arabic1", "Hebrew2", "Arabic2", "HindiLetter1", "HindiLetter2", "HindiArabic", "HindiCardinalText", "ThaiLetter", "ThaiArabic", "ThaiCardinalText", "VietCardinalText", "NumberInDash", "LowercaseRussian", "UppercaseRussian", "None", "Custom"])
      return false unless number_style_validator.valid?(@number_style)
      alignment_validator = EnumAttributeValidator.new('String', ["Left", "Center", "Right"])
      return false unless alignment_validator.valid?(@alignment)
      trailing_character_validator = EnumAttributeValidator.new('String', ["Tab", "Space", "Nothing"])
      return false unless trailing_character_validator.valid?(@trailing_character)

      return true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] number_style Object to be assigned
    def number_style=(number_style)
      validator = EnumAttributeValidator.new('String', ["Arabic", "UppercaseRoman", "LowercaseRoman", "UppercaseLetter", "LowercaseLetter", "Ordinal", "Number", "OrdinalText", "Hex", "ChicagoManual", "Kanji", "KanjiDigit", "AiueoHalfWidth", "IrohaHalfWidth", "ArabicFullWidth", "ArabicHalfWidth", "KanjiTraditional", "KanjiTraditional2", "NumberInCircle", "DecimalFullWidth", "Aiueo", "Iroha", "LeadingZero", "Bullet", "Ganada", "Chosung", "GB1", "GB2", "GB3", "GB4", "Zodiac1", "Zodiac2", "Zodiac3", "TradChinNum1", "TradChinNum2", "TradChinNum3", "TradChinNum4", "SimpChinNum1", "SimpChinNum2", "SimpChinNum3", "SimpChinNum4", "HanjaRead", "HanjaReadDigit", "Hangul", "Hanja", "Hebrew1", "Arabic1", "Hebrew2", "Arabic2", "HindiLetter1", "HindiLetter2", "HindiArabic", "HindiCardinalText", "ThaiLetter", "ThaiArabic", "ThaiCardinalText", "VietCardinalText", "NumberInDash", "LowercaseRussian", "UppercaseRussian", "None", "Custom"])
      if number_style.to_i == 0
        unless validator.valid?(number_style)
          raise ArgumentError, "invalid value for 'number_style', must be one of #{validator.allowable_values}."
        end
        @number_style = number_style
      else
        @number_style = validator.allowable_values[number_style.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] alignment Object to be assigned
    def alignment=(alignment)
      validator = EnumAttributeValidator.new('String', ["Left", "Center", "Right"])
      if alignment.to_i == 0
        unless validator.valid?(alignment)
          raise ArgumentError, "invalid value for 'alignment', must be one of #{validator.allowable_values}."
        end
        @alignment = alignment
      else
        @alignment = validator.allowable_values[alignment.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] trailing_character Object to be assigned
    def trailing_character=(trailing_character)
      validator = EnumAttributeValidator.new('String', ["Tab", "Space", "Nothing"])
      if trailing_character.to_i == 0
        unless validator.valid?(trailing_character)
          raise ArgumentError, "invalid value for 'trailing_character', must be one of #{validator.allowable_values}."
        end
        @trailing_character = trailing_character
      else
        @trailing_character = validator.allowable_values[trailing_character.to_i]
      end
    end


    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(other)
      return true if self.equal?(other)
      self.class == other.class &&
          link == other.link &&
          start_at == other.start_at &&
          number_style == other.number_style &&
          number_format == other.number_format &&
          alignment == other.alignment &&
          is_legal == other.is_legal &&
          restart_after_level == other.restart_after_level &&
          trailing_character == other.trailing_character &&
          font == other.font &&
          tab_position == other.tab_position &&
          number_position == other.number_position &&
          text_position == other.text_position &&
          linked_style == other.linked_style
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [link, start_at, number_style, number_format, alignment, is_legal, restart_after_level, trailing_character, font, tab_position, number_position, text_position, linked_style].hash
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
      raise ArgumentError, 'Property start_at in ListLevel is required.' if self.start_at.nil?
      raise ArgumentError, 'Property number_style in ListLevel is required.' if self.number_style.nil?
      raise ArgumentError, 'Property alignment in ListLevel is required.' if self.alignment.nil?
      raise ArgumentError, 'Property is_legal in ListLevel is required.' if self.is_legal.nil?
      raise ArgumentError, 'Property restart_after_level in ListLevel is required.' if self.restart_after_level.nil?
      raise ArgumentError, 'Property trailing_character in ListLevel is required.' if self.trailing_character.nil?
      raise ArgumentError, 'Property tab_position in ListLevel is required.' if self.tab_position.nil?
      raise ArgumentError, 'Property number_position in ListLevel is required.' if self.number_position.nil?
      raise ArgumentError, 'Property text_position in ListLevel is required.' if self.text_position.nil?
      unless self.link.nil?
          self.link.validate
      end
      unless self.font.nil?
          self.font.validate
      end
      unless self.linked_style.nil?
          self.linked_style.validate
      end

    end

  end
end
