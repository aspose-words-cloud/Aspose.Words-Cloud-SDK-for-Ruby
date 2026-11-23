# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="field_options.rb">
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

  # DTO for field options.
  class FieldOptions
    # Gets or sets Current User.
    attr_accessor :current_user


    # Gets or sets Custom Toc Style Separator.
    attr_accessor :custom_toc_style_separator


    # Gets or sets Default Document Author.
    attr_accessor :default_document_author


    # Gets or sets Field Index Format.
    attr_reader :field_index_format


    # Gets or sets Field Update Culture Name.
    # It is used for all fields if FieldUpdateCultureSource is FieldCode.
    attr_accessor :field_update_culture_name


    # Gets or sets Field Update Culture Source.
    attr_reader :field_update_culture_source


    # Gets or sets File Name.
    attr_accessor :file_name


    # Gets or sets if Bidi Text Supported OnUpdate.
    attr_accessor :is_bidi_text_supported_on_update


    # Gets or sets if Legacy Number Format.
    attr_accessor :legacy_number_format


    # Gets or sets PreProcess Culture Name.
    # It is a culture code for DOC fields.
    attr_accessor :pre_process_culture_name


    # Gets or sets Template Name.
    attr_accessor :template_name


    # Gets or sets if Use Invariant Culture Number Format.
    attr_accessor :use_invariant_culture_number_format


    # Gets or sets BuiltIn Templates Paths.
    attr_accessor :built_in_templates_paths


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
        :'current_user' => :'CurrentUser',
        :'custom_toc_style_separator' => :'CustomTocStyleSeparator',
        :'default_document_author' => :'DefaultDocumentAuthor',
        :'field_index_format' => :'FieldIndexFormat',
        :'field_update_culture_name' => :'FieldUpdateCultureName',
        :'field_update_culture_source' => :'FieldUpdateCultureSource',
        :'file_name' => :'FileName',
        :'is_bidi_text_supported_on_update' => :'IsBidiTextSupportedOnUpdate',
        :'legacy_number_format' => :'LegacyNumberFormat',
        :'pre_process_culture_name' => :'PreProcessCultureName',
        :'template_name' => :'TemplateName',
        :'use_invariant_culture_number_format' => :'UseInvariantCultureNumberFormat',
        :'built_in_templates_paths' => :'BuiltInTemplatesPaths'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'current_user' => :'UserInformation',
        :'custom_toc_style_separator' => :'String',
        :'default_document_author' => :'String',
        :'field_index_format' => :'String',
        :'field_update_culture_name' => :'String',
        :'field_update_culture_source' => :'String',
        :'file_name' => :'String',
        :'is_bidi_text_supported_on_update' => :'BOOLEAN',
        :'legacy_number_format' => :'BOOLEAN',
        :'pre_process_culture_name' => :'String',
        :'template_name' => :'String',
        :'use_invariant_culture_number_format' => :'BOOLEAN',
        :'built_in_templates_paths' => :'Array<String>'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.key?(:'CurrentUser')
        self.current_user = attributes[:'CurrentUser']
      end

      if attributes.key?(:'CustomTocStyleSeparator')
        self.custom_toc_style_separator = attributes[:'CustomTocStyleSeparator']
      end

      if attributes.key?(:'DefaultDocumentAuthor')
        self.default_document_author = attributes[:'DefaultDocumentAuthor']
      end

      if attributes.key?(:'FieldIndexFormat')
        self.field_index_format = attributes[:'FieldIndexFormat']
      end

      if attributes.key?(:'FieldUpdateCultureName')
        self.field_update_culture_name = attributes[:'FieldUpdateCultureName']
      end

      if attributes.key?(:'FieldUpdateCultureSource')
        self.field_update_culture_source = attributes[:'FieldUpdateCultureSource']
      end

      if attributes.key?(:'FileName')
        self.file_name = attributes[:'FileName']
      end

      if attributes.key?(:'IsBidiTextSupportedOnUpdate')
        self.is_bidi_text_supported_on_update = attributes[:'IsBidiTextSupportedOnUpdate']
      end

      if attributes.key?(:'LegacyNumberFormat')
        self.legacy_number_format = attributes[:'LegacyNumberFormat']
      end

      if attributes.key?(:'PreProcessCultureName')
        self.pre_process_culture_name = attributes[:'PreProcessCultureName']
      end

      if attributes.key?(:'TemplateName')
        self.template_name = attributes[:'TemplateName']
      end

      if attributes.key?(:'UseInvariantCultureNumberFormat')
        self.use_invariant_culture_number_format = attributes[:'UseInvariantCultureNumberFormat']
      end

      if attributes.key?(:'BuiltInTemplatesPaths')
        if (value = attributes[:'BuiltInTemplatesPaths']).is_a?(Array)
          self.built_in_templates_paths = value
        end
      end
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      field_index_format_validator = EnumAttributeValidator.new('String', ["Template", "Classic", "Fancy", "Modern", "Bulleted", "Formal", "Simple"])
      return false unless field_index_format_validator.valid?(@field_index_format)
      field_update_culture_source_validator = EnumAttributeValidator.new('String', ["CurrentThread", "FieldCode"])
      return false unless field_update_culture_source_validator.valid?(@field_update_culture_source)

      return true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] field_index_format Object to be assigned
    def field_index_format=(field_index_format)
      validator = EnumAttributeValidator.new('String', ["Template", "Classic", "Fancy", "Modern", "Bulleted", "Formal", "Simple"])
      if field_index_format.to_i == 0
        unless validator.valid?(field_index_format)
          raise ArgumentError, "invalid value for 'field_index_format', must be one of #{validator.allowable_values}."
        end
        @field_index_format = field_index_format
      else
        @field_index_format = validator.allowable_values[field_index_format.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] field_update_culture_source Object to be assigned
    def field_update_culture_source=(field_update_culture_source)
      validator = EnumAttributeValidator.new('String', ["CurrentThread", "FieldCode"])
      if field_update_culture_source.to_i == 0
        unless validator.valid?(field_update_culture_source)
          raise ArgumentError, "invalid value for 'field_update_culture_source', must be one of #{validator.allowable_values}."
        end
        @field_update_culture_source = field_update_culture_source
      else
        @field_update_culture_source = validator.allowable_values[field_update_culture_source.to_i]
      end
    end


    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(other)
      return true if self.equal?(other)
      self.class == other.class &&
          current_user == other.current_user &&
          custom_toc_style_separator == other.custom_toc_style_separator &&
          default_document_author == other.default_document_author &&
          field_index_format == other.field_index_format &&
          field_update_culture_name == other.field_update_culture_name &&
          field_update_culture_source == other.field_update_culture_source &&
          file_name == other.file_name &&
          is_bidi_text_supported_on_update == other.is_bidi_text_supported_on_update &&
          legacy_number_format == other.legacy_number_format &&
          pre_process_culture_name == other.pre_process_culture_name &&
          template_name == other.template_name &&
          use_invariant_culture_number_format == other.use_invariant_culture_number_format &&
          built_in_templates_paths == other.built_in_templates_paths
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [current_user, custom_toc_style_separator, default_document_author, field_index_format, field_update_culture_name, field_update_culture_source, file_name, is_bidi_text_supported_on_update, legacy_number_format, pre_process_culture_name, template_name, use_invariant_culture_number_format, built_in_templates_paths].hash
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
      unless self.current_user.nil?
          self.current_user.validate
      end

    end

  end
end
