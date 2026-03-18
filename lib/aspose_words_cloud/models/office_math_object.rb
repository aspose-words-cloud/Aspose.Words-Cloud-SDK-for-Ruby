# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="office_math_object.rb">
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

  # DTO container with an OfficeMath object.
  class OfficeMathObject
    # Gets or sets the link to the document.
    attr_accessor :link

    # Gets or sets the node id.
    attr_accessor :node_id

    # Gets or sets the content of a footnote.
    attr_accessor :content

    # Gets or sets the display format type of the OfficeMath object. This display format defines whether an equation is displayed inline with the text or displayed on its own line.
    # Display format type has effect for top level Office Math only.Returned display format type is always Inline for nested Office Math.
    attr_accessor :display_type

    # Gets or sets the justification of the OfficeMath object.
    # Justification cannot be set to the Office Math with display format type Inline.Inline justification cannot be set to the Office Math with display format type Display.Corresponding DisplayType has to be set before setting Office Math justification.
    attr_accessor :justification

    # Gets or sets the type of the OfficeMath object.
    attr_accessor :math_object_type

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
        :'node_id' => :'NodeId',
        :'content' => :'Content',
        :'display_type' => :'DisplayType',
        :'justification' => :'Justification',
        :'math_object_type' => :'MathObjectType'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'link' => :'WordsApiLink',
        :'node_id' => :'String',
        :'content' => :'StoryChildNodes',
        :'display_type' => :'String',
        :'justification' => :'String',
        :'math_object_type' => :'String'
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

      if attributes.key?(:'NodeId')
        self.node_id = attributes[:'NodeId']
      end

      if attributes.key?(:'Content')
        self.content = attributes[:'Content']
      end

      if attributes.key?(:'DisplayType')
        self.display_type = attributes[:'DisplayType']
      end

      if attributes.key?(:'Justification')
        self.justification = attributes[:'Justification']
      end

      if attributes.key?(:'MathObjectType')
        self.math_object_type = attributes[:'MathObjectType']
      end
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      display_type_validator = EnumAttributeValidator.new('String', ["Display", "Inline"])
      return false unless display_type_validator.valid?(@display_type)
      justification_validator = EnumAttributeValidator.new('String', ["CenterGroup", "Default", "Center", "Left", "Right", "Inline"])
      return false unless justification_validator.valid?(@justification)
      math_object_type_validator = EnumAttributeValidator.new('String', ["OMath", "OMathPara", "Accent", "Bar", "BorderBox", "Box", "Delimiter", "Degree", "Argument", "Array", "Fraction", "Denominator", "Numerator", "Function", "FunctionName", "GroupCharacter", "Limit", "LowerLimit", "UpperLimit", "Matrix", "MatrixRow", "NAry", "Phantom", "Radical", "SubscriptPart", "SuperscriptPart", "PreSubSuperscript", "Subscript", "SubSuperscript", "Superscript", "None"])
      return false unless math_object_type_validator.valid?(@math_object_type)

      return true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] display_type Object to be assigned
    def display_type=(display_type)
      validator = EnumAttributeValidator.new('String', ["Display", "Inline"])
      if display_type.to_i == 0
        unless validator.valid?(display_type)
          raise ArgumentError, "invalid value for 'display_type', must be one of #{validator.allowable_values}."
        end
        @display_type = display_type
      else
        @display_type = validator.allowable_values[display_type.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] justification Object to be assigned
    def justification=(justification)
      validator = EnumAttributeValidator.new('String', ["CenterGroup", "Default", "Center", "Left", "Right", "Inline"])
      if justification.to_i == 0
        unless validator.valid?(justification)
          raise ArgumentError, "invalid value for 'justification', must be one of #{validator.allowable_values}."
        end
        @justification = justification
      else
        @justification = validator.allowable_values[justification.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] math_object_type Object to be assigned
    def math_object_type=(math_object_type)
      validator = EnumAttributeValidator.new('String', ["OMath", "OMathPara", "Accent", "Bar", "BorderBox", "Box", "Delimiter", "Degree", "Argument", "Array", "Fraction", "Denominator", "Numerator", "Function", "FunctionName", "GroupCharacter", "Limit", "LowerLimit", "UpperLimit", "Matrix", "MatrixRow", "NAry", "Phantom", "Radical", "SubscriptPart", "SuperscriptPart", "PreSubSuperscript", "Subscript", "SubSuperscript", "Superscript", "None"])
      if math_object_type.to_i == 0
        unless validator.valid?(math_object_type)
          raise ArgumentError, "invalid value for 'math_object_type', must be one of #{validator.allowable_values}."
        end
        @math_object_type = math_object_type
      else
        @math_object_type = validator.allowable_values[math_object_type.to_i]
      end
    end


    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(other)
      return true if self.equal?(other)
      self.class == other.class &&
          link == other.link &&
          node_id == other.node_id &&
          content == other.content &&
          display_type == other.display_type &&
          justification == other.justification &&
          math_object_type == other.math_object_type
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [link, node_id, content, display_type, justification, math_object_type].hash
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
      unless self.link.nil?
          self.link.validate
      end
      unless self.content.nil?
          self.content.validate
      end

    end

  end
end
