# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="list_info.rb">
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

  # DTO container with a single document list.
  class ListInfo
    # Gets or sets the link to the document.
    attr_accessor :link


    # Gets or sets the unique identifier of the list.
    # You do not normally need to use this property. But if you use it, you normally do so in conjunction with the Aspose.Words.Lists.ListCollection.GetListByListId(System.Int32) method to find a list by its identifier.
    attr_accessor :list_id


    # Gets or sets a value indicating whether the list contains 9 levels; false when 1 level.
    # The lists that you create with Aspose.Words are always multi-level lists and contain 9 levels. Microsoft Word 2003 and later always create multi-level lists with 9 levels. But in some documents, created with earlier versions of Microsoft Word you might encounter lists that have 1 level only.
    attr_accessor :is_multi_level


    # Gets or sets a value indicating whether list should be restarted at each section. The default value is false.
    # This option is supported only in RTF, DOC and DOCX document formats. This option will be written to DOCX only if Aspose.Words.Saving.OoxmlCompliance is higher then Aspose.Words.Saving.OoxmlCompliance.Ecma376_2006.
    attr_accessor :is_restart_at_each_section


    # Gets or sets a value indicating whether this list is a definition of a list style.
    # When this property is true, the Aspose.Words.Lists.List.Style property returns the list style that this list defines. By modifying properties of a list that defines a list style, you modify The properties of the list style. A list that is a definition of a list style cannot be applied directly to paragraphs to make them numbered. Aspose.Words.Lists.List.Style Aspose.Words.Lists.List.IsListStyleReference.
    attr_accessor :is_list_style_definition


    # Gets or sets a value indicating whether this list is a reference to a list style.
    # Note, modifying properties of a list that is a reference to list style has no effect. The list formatting specified in the list style itself always takes precedence. Aspose.Words.Lists.List.Style Aspose.Words.Lists.List.IsListStyleDefinition.
    attr_accessor :is_list_style_reference


    # Gets or sets the list style that this list references or defines.
    # If this list is not associated with a list style, the property will return null. A list could be a reference to a list style, in this case Aspose.Words.Lists.List.IsListStyleReference will be true. A list could be a definition of a list style, in this case Aspose.Words.Lists.List.IsListStyleDefinition will be true. Such a list cannot be applied to paragraphs in the document directly.
    attr_accessor :style


    # Gets or sets the collection of list levels for this list.
    # Use this property to access and modify formatting individual to each level of the list.
    attr_accessor :list_levels

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'link' => :'Link',
        :'list_id' => :'ListId',
        :'is_multi_level' => :'IsMultiLevel',
        :'is_restart_at_each_section' => :'IsRestartAtEachSection',
        :'is_list_style_definition' => :'IsListStyleDefinition',
        :'is_list_style_reference' => :'IsListStyleReference',
        :'style' => :'Style',
        :'list_levels' => :'ListLevels'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'link' => :'WordsApiLink',
        :'list_id' => :'Integer',
        :'is_multi_level' => :'BOOLEAN',
        :'is_restart_at_each_section' => :'BOOLEAN',
        :'is_list_style_definition' => :'BOOLEAN',
        :'is_list_style_reference' => :'BOOLEAN',
        :'style' => :'Style',
        :'list_levels' => :'ListLevels'
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

      if attributes.key?(:'ListId')
        self.list_id = attributes[:'ListId']
      end

      if attributes.key?(:'IsMultiLevel')
        self.is_multi_level = attributes[:'IsMultiLevel']
      end

      if attributes.key?(:'IsRestartAtEachSection')
        self.is_restart_at_each_section = attributes[:'IsRestartAtEachSection']
      end

      if attributes.key?(:'IsListStyleDefinition')
        self.is_list_style_definition = attributes[:'IsListStyleDefinition']
      end

      if attributes.key?(:'IsListStyleReference')
        self.is_list_style_reference = attributes[:'IsListStyleReference']
      end

      if attributes.key?(:'Style')
        self.style = attributes[:'Style']
      end

      if attributes.key?(:'ListLevels')
        self.list_levels = attributes[:'ListLevels']
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
          link == other.link &&
          list_id == other.list_id &&
          is_multi_level == other.is_multi_level &&
          is_restart_at_each_section == other.is_restart_at_each_section &&
          is_list_style_definition == other.is_list_style_definition &&
          is_list_style_reference == other.is_list_style_reference &&
          style == other.style &&
          list_levels == other.list_levels
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [link, list_id, is_multi_level, is_restart_at_each_section, is_list_style_definition, is_list_style_reference, style, list_levels].hash
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
      raise ArgumentError, 'Property list_id in ListInfo is required.' if self.list_id.nil?
      raise ArgumentError, 'Property is_multi_level in ListInfo is required.' if self.is_multi_level.nil?
      raise ArgumentError, 'Property is_restart_at_each_section in ListInfo is required.' if self.is_restart_at_each_section.nil?
      raise ArgumentError, 'Property is_list_style_definition in ListInfo is required.' if self.is_list_style_definition.nil?
      raise ArgumentError, 'Property is_list_style_reference in ListInfo is required.' if self.is_list_style_reference.nil?
      unless self.link.nil?
          self.link.validate
      end
      unless self.style.nil?
          self.style.validate
      end
      unless self.list_levels.nil?
          self.list_levels.validate
      end

    end

  end
end
