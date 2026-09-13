# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="xps_save_options_data.rb">
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

  # Container class for xps save options.
  class XpsSaveOptionsData
    # Gets or sets a boolean value indicating whether to allow embedding fonts with PostScript outlines when embedding TrueType fonts in a document upon it is saved. The default value is false..
    # Note, Word does not embed PostScript fonts, but can open documents with embedded fonts of this type.
    # This option only works when Aspose.Words.Fonts.FontInfoCollection.EmbedTrueTypeFonts of the Aspose.Words.DocumentBase.FontInfos property is set to true.
    # The default value is false.
    attr_accessor :allow_embedding_post_script_fonts

    # Gets or sets CustomTimeZoneInfo.
    attr_accessor :custom_time_zone_info_data

    # Gets or sets the value determining how 3D effects are rendered.
    # The default value is Aspose.Words.Saving.Dml3DEffectsRenderingMode.Basic.
    attr_accessor :dml3_d_effects_rendering_mode

    # Gets or sets the value determining how DrawingML effects are rendered.
    # { Simplified | None | Fine }.
    # The default value is Simplified.
    # This property is used when the document is exported to fixed page formats.
    attr_accessor :dml_effects_rendering_mode

    # Gets or sets the option that controls how DrawingML shapes are rendered.
    # { Fallback | DrawingML }. The default value is Fallback.
    # This property is used when the document is exported to fixed page formats.
    attr_accessor :dml_rendering_mode

    # Gets or sets the name of destination file.
    attr_accessor :file_name

    # Gets or sets the value determining how ink (InkML) objects are rendered.
    # The default value is Aspose.Words.Saving.ImlRenderingMode.InkML.
    attr_accessor :iml_rendering_mode

    # Gets or sets a value indicating whether the font attributes will be changed according to the character code being used.
    attr_accessor :update_ambiguous_text_font

    # Gets or sets a value determining whether the Aspose.Words.Properties.BuiltInDocumentProperties.CreatedTime property is updated before saving.
    # The default value is false.
    attr_accessor :update_created_time_property

    # Gets or sets a value indicating whether fields should be updated before saving the document to a fixed page format. The default value is true.
    attr_accessor :update_fields

    # Gets or sets a value indicating whether the Aspose.Words.Properties.BuiltInDocumentProperties.LastPrinted property is updated before saving.
    attr_accessor :update_last_printed_property

    # Gets or sets a value indicating whether the Aspose.Words.Properties.BuiltInDocumentProperties.LastSavedTime property is updated before saving.
    # The default value is false.
    attr_accessor :update_last_saved_time_property

    # Gets or sets a value indicating whether to zip output or not.
    # The default value is false.
    # When set to true, output files will be zipped.
    attr_accessor :zip_output

    # Gets or sets the value determining how colors are rendered.
    # { Normal | Grayscale}.
    # The default value is Normal.
    # This property is used when the document is exported to fixed page formats.
    attr_accessor :color_mode

    # Gets or sets the quality of the JPEG images inside PDF document.
    attr_accessor :jpeg_quality

    # Gets or sets the metafile rendering options.
    attr_accessor :metafile_rendering_options

    # Gets or sets the symbol set, that is used to represent numbers while rendering to fixed page formats.
    attr_accessor :numeral_format

    # Gets or sets a value indicating whether it is required to optimize output of XPS.
    # If this flag is set redundant nested canvases and empty canvases are removed, also neighbor glyphs with the same formatting are concatenated.
    # Note: The accuracy of the content display may be affected if this property is set to true.. The default value is false.
    attr_accessor :optimize_output

    # Gets or sets the number of pages to render.
    attr_accessor :page_count

    # Gets or sets the 0-based index of the first page to render.
    attr_accessor :page_index

    # Gets or sets the level in the XPS document outline at which to display Word bookmarks.
    attr_accessor :bookmarks_outline_level

    # Gets or sets a compression level used to save document.
    # The default value is Normal.
    attr_accessor :compression_level

    # Gets or sets the details for signing the output document.
    attr_accessor :digital_signature_details

    # Gets or sets the number of heading levels (paragraphs formatted with the Heading styles) to include in the XPS document outline.
    attr_accessor :headings_outline_levels

    # Gets or sets the outline options.
    attr_accessor :outline_options

    # Gets or sets a value indicating whether the document should be saved using a booklet printing layout.
    attr_accessor :use_book_fold_printing_settings

    # Gets the format of save.
    attr_accessor :save_format

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
        :'allow_embedding_post_script_fonts' => :'AllowEmbeddingPostScriptFonts',
        :'custom_time_zone_info_data' => :'CustomTimeZoneInfoData',
        :'dml3_d_effects_rendering_mode' => :'Dml3DEffectsRenderingMode',
        :'dml_effects_rendering_mode' => :'DmlEffectsRenderingMode',
        :'dml_rendering_mode' => :'DmlRenderingMode',
        :'file_name' => :'FileName',
        :'iml_rendering_mode' => :'ImlRenderingMode',
        :'update_ambiguous_text_font' => :'UpdateAmbiguousTextFont',
        :'update_created_time_property' => :'UpdateCreatedTimeProperty',
        :'update_fields' => :'UpdateFields',
        :'update_last_printed_property' => :'UpdateLastPrintedProperty',
        :'update_last_saved_time_property' => :'UpdateLastSavedTimeProperty',
        :'zip_output' => :'ZipOutput',
        :'color_mode' => :'ColorMode',
        :'jpeg_quality' => :'JpegQuality',
        :'metafile_rendering_options' => :'MetafileRenderingOptions',
        :'numeral_format' => :'NumeralFormat',
        :'optimize_output' => :'OptimizeOutput',
        :'page_count' => :'PageCount',
        :'page_index' => :'PageIndex',
        :'bookmarks_outline_level' => :'BookmarksOutlineLevel',
        :'compression_level' => :'CompressionLevel',
        :'digital_signature_details' => :'DigitalSignatureDetails',
        :'headings_outline_levels' => :'HeadingsOutlineLevels',
        :'outline_options' => :'OutlineOptions',
        :'use_book_fold_printing_settings' => :'UseBookFoldPrintingSettings',
        :'save_format' => :'SaveFormat'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'allow_embedding_post_script_fonts' => :'BOOLEAN',
        :'custom_time_zone_info_data' => :'TimeZoneInfoData',
        :'dml3_d_effects_rendering_mode' => :'String',
        :'dml_effects_rendering_mode' => :'String',
        :'dml_rendering_mode' => :'String',
        :'file_name' => :'String',
        :'iml_rendering_mode' => :'String',
        :'update_ambiguous_text_font' => :'BOOLEAN',
        :'update_created_time_property' => :'BOOLEAN',
        :'update_fields' => :'BOOLEAN',
        :'update_last_printed_property' => :'BOOLEAN',
        :'update_last_saved_time_property' => :'BOOLEAN',
        :'zip_output' => :'BOOLEAN',
        :'color_mode' => :'String',
        :'jpeg_quality' => :'Integer',
        :'metafile_rendering_options' => :'MetafileRenderingOptionsData',
        :'numeral_format' => :'String',
        :'optimize_output' => :'BOOLEAN',
        :'page_count' => :'Integer',
        :'page_index' => :'Integer',
        :'bookmarks_outline_level' => :'Integer',
        :'compression_level' => :'String',
        :'digital_signature_details' => :'DigitalSignatureDetails',
        :'headings_outline_levels' => :'Integer',
        :'outline_options' => :'OutlineOptionsData',
        :'use_book_fold_printing_settings' => :'BOOLEAN',
        :'save_format' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.save_format = 'xps'

      if attributes.key?(:'AllowEmbeddingPostScriptFonts')
        self.allow_embedding_post_script_fonts = attributes[:'AllowEmbeddingPostScriptFonts']
      end

      if attributes.key?(:'CustomTimeZoneInfoData')
        self.custom_time_zone_info_data = attributes[:'CustomTimeZoneInfoData']
      end

      if attributes.key?(:'Dml3DEffectsRenderingMode')
        self.dml3_d_effects_rendering_mode = attributes[:'Dml3DEffectsRenderingMode']
      end

      if attributes.key?(:'DmlEffectsRenderingMode')
        self.dml_effects_rendering_mode = attributes[:'DmlEffectsRenderingMode']
      end

      if attributes.key?(:'DmlRenderingMode')
        self.dml_rendering_mode = attributes[:'DmlRenderingMode']
      end

      if attributes.key?(:'FileName')
        self.file_name = attributes[:'FileName']
      end

      if attributes.key?(:'ImlRenderingMode')
        self.iml_rendering_mode = attributes[:'ImlRenderingMode']
      end

      if attributes.key?(:'UpdateAmbiguousTextFont')
        self.update_ambiguous_text_font = attributes[:'UpdateAmbiguousTextFont']
      end

      if attributes.key?(:'UpdateCreatedTimeProperty')
        self.update_created_time_property = attributes[:'UpdateCreatedTimeProperty']
      end

      if attributes.key?(:'UpdateFields')
        self.update_fields = attributes[:'UpdateFields']
      end

      if attributes.key?(:'UpdateLastPrintedProperty')
        self.update_last_printed_property = attributes[:'UpdateLastPrintedProperty']
      end

      if attributes.key?(:'UpdateLastSavedTimeProperty')
        self.update_last_saved_time_property = attributes[:'UpdateLastSavedTimeProperty']
      end

      if attributes.key?(:'ZipOutput')
        self.zip_output = attributes[:'ZipOutput']
      end

      if attributes.key?(:'ColorMode')
        self.color_mode = attributes[:'ColorMode']
      end

      if attributes.key?(:'JpegQuality')
        self.jpeg_quality = attributes[:'JpegQuality']
      end

      if attributes.key?(:'MetafileRenderingOptions')
        self.metafile_rendering_options = attributes[:'MetafileRenderingOptions']
      end

      if attributes.key?(:'NumeralFormat')
        self.numeral_format = attributes[:'NumeralFormat']
      end

      if attributes.key?(:'OptimizeOutput')
        self.optimize_output = attributes[:'OptimizeOutput']
      end

      if attributes.key?(:'PageCount')
        self.page_count = attributes[:'PageCount']
      end

      if attributes.key?(:'PageIndex')
        self.page_index = attributes[:'PageIndex']
      end

      if attributes.key?(:'BookmarksOutlineLevel')
        self.bookmarks_outline_level = attributes[:'BookmarksOutlineLevel']
      end

      if attributes.key?(:'CompressionLevel')
        self.compression_level = attributes[:'CompressionLevel']
      end

      if attributes.key?(:'DigitalSignatureDetails')
        self.digital_signature_details = attributes[:'DigitalSignatureDetails']
      end

      if attributes.key?(:'HeadingsOutlineLevels')
        self.headings_outline_levels = attributes[:'HeadingsOutlineLevels']
      end

      if attributes.key?(:'OutlineOptions')
        self.outline_options = attributes[:'OutlineOptions']
      end

      if attributes.key?(:'UseBookFoldPrintingSettings')
        self.use_book_fold_printing_settings = attributes[:'UseBookFoldPrintingSettings']
      end
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      dml3_d_effects_rendering_mode_validator = EnumAttributeValidator.new('String', ["Basic", "Advanced"])
      return false unless dml3_d_effects_rendering_mode_validator.valid?(@dml3_d_effects_rendering_mode)
      dml_effects_rendering_mode_validator = EnumAttributeValidator.new('String', ["Simplified", "None", "Fine"])
      return false unless dml_effects_rendering_mode_validator.valid?(@dml_effects_rendering_mode)
      dml_rendering_mode_validator = EnumAttributeValidator.new('String', ["Fallback", "DrawingML"])
      return false unless dml_rendering_mode_validator.valid?(@dml_rendering_mode)
      iml_rendering_mode_validator = EnumAttributeValidator.new('String', ["Fallback", "InkML"])
      return false unless iml_rendering_mode_validator.valid?(@iml_rendering_mode)
      color_mode_validator = EnumAttributeValidator.new('String', ["Normal", "Grayscale"])
      return false unless color_mode_validator.valid?(@color_mode)
      numeral_format_validator = EnumAttributeValidator.new('String', ["European", "ArabicIndic", "EasternArabicIndic", "Context", "System"])
      return false unless numeral_format_validator.valid?(@numeral_format)
      compression_level_validator = EnumAttributeValidator.new('String', ["Normal", "Maximum", "Fast", "SuperFast"])
      return false unless compression_level_validator.valid?(@compression_level)

      return true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] dml3_d_effects_rendering_mode Object to be assigned
    def dml3_d_effects_rendering_mode=(dml3_d_effects_rendering_mode)
      validator = EnumAttributeValidator.new('String', ["Basic", "Advanced"])
      if dml3_d_effects_rendering_mode.to_i == 0
        unless validator.valid?(dml3_d_effects_rendering_mode)
          raise ArgumentError, "invalid value for 'dml3_d_effects_rendering_mode', must be one of #{validator.allowable_values}."
        end
        @dml3_d_effects_rendering_mode = dml3_d_effects_rendering_mode
      else
        @dml3_d_effects_rendering_mode = validator.allowable_values[dml3_d_effects_rendering_mode.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] dml_effects_rendering_mode Object to be assigned
    def dml_effects_rendering_mode=(dml_effects_rendering_mode)
      validator = EnumAttributeValidator.new('String', ["Simplified", "None", "Fine"])
      if dml_effects_rendering_mode.to_i == 0
        unless validator.valid?(dml_effects_rendering_mode)
          raise ArgumentError, "invalid value for 'dml_effects_rendering_mode', must be one of #{validator.allowable_values}."
        end
        @dml_effects_rendering_mode = dml_effects_rendering_mode
      else
        @dml_effects_rendering_mode = validator.allowable_values[dml_effects_rendering_mode.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] dml_rendering_mode Object to be assigned
    def dml_rendering_mode=(dml_rendering_mode)
      validator = EnumAttributeValidator.new('String', ["Fallback", "DrawingML"])
      if dml_rendering_mode.to_i == 0
        unless validator.valid?(dml_rendering_mode)
          raise ArgumentError, "invalid value for 'dml_rendering_mode', must be one of #{validator.allowable_values}."
        end
        @dml_rendering_mode = dml_rendering_mode
      else
        @dml_rendering_mode = validator.allowable_values[dml_rendering_mode.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] iml_rendering_mode Object to be assigned
    def iml_rendering_mode=(iml_rendering_mode)
      validator = EnumAttributeValidator.new('String', ["Fallback", "InkML"])
      if iml_rendering_mode.to_i == 0
        unless validator.valid?(iml_rendering_mode)
          raise ArgumentError, "invalid value for 'iml_rendering_mode', must be one of #{validator.allowable_values}."
        end
        @iml_rendering_mode = iml_rendering_mode
      else
        @iml_rendering_mode = validator.allowable_values[iml_rendering_mode.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] color_mode Object to be assigned
    def color_mode=(color_mode)
      validator = EnumAttributeValidator.new('String', ["Normal", "Grayscale"])
      if color_mode.to_i == 0
        unless validator.valid?(color_mode)
          raise ArgumentError, "invalid value for 'color_mode', must be one of #{validator.allowable_values}."
        end
        @color_mode = color_mode
      else
        @color_mode = validator.allowable_values[color_mode.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] numeral_format Object to be assigned
    def numeral_format=(numeral_format)
      validator = EnumAttributeValidator.new('String', ["European", "ArabicIndic", "EasternArabicIndic", "Context", "System"])
      if numeral_format.to_i == 0
        unless validator.valid?(numeral_format)
          raise ArgumentError, "invalid value for 'numeral_format', must be one of #{validator.allowable_values}."
        end
        @numeral_format = numeral_format
      else
        @numeral_format = validator.allowable_values[numeral_format.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] compression_level Object to be assigned
    def compression_level=(compression_level)
      validator = EnumAttributeValidator.new('String', ["Normal", "Maximum", "Fast", "SuperFast"])
      if compression_level.to_i == 0
        unless validator.valid?(compression_level)
          raise ArgumentError, "invalid value for 'compression_level', must be one of #{validator.allowable_values}."
        end
        @compression_level = compression_level
      else
        @compression_level = validator.allowable_values[compression_level.to_i]
      end
    end


    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(other)
      return true if self.equal?(other)
      self.class == other.class &&
          allow_embedding_post_script_fonts == other.allow_embedding_post_script_fonts &&
          custom_time_zone_info_data == other.custom_time_zone_info_data &&
          dml3_d_effects_rendering_mode == other.dml3_d_effects_rendering_mode &&
          dml_effects_rendering_mode == other.dml_effects_rendering_mode &&
          dml_rendering_mode == other.dml_rendering_mode &&
          file_name == other.file_name &&
          iml_rendering_mode == other.iml_rendering_mode &&
          update_ambiguous_text_font == other.update_ambiguous_text_font &&
          update_created_time_property == other.update_created_time_property &&
          update_fields == other.update_fields &&
          update_last_printed_property == other.update_last_printed_property &&
          update_last_saved_time_property == other.update_last_saved_time_property &&
          zip_output == other.zip_output &&
          color_mode == other.color_mode &&
          jpeg_quality == other.jpeg_quality &&
          metafile_rendering_options == other.metafile_rendering_options &&
          numeral_format == other.numeral_format &&
          optimize_output == other.optimize_output &&
          page_count == other.page_count &&
          page_index == other.page_index &&
          bookmarks_outline_level == other.bookmarks_outline_level &&
          compression_level == other.compression_level &&
          digital_signature_details == other.digital_signature_details &&
          headings_outline_levels == other.headings_outline_levels &&
          outline_options == other.outline_options &&
          use_book_fold_printing_settings == other.use_book_fold_printing_settings &&
          save_format == other.save_format
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [allow_embedding_post_script_fonts, custom_time_zone_info_data, dml3_d_effects_rendering_mode, dml_effects_rendering_mode, dml_rendering_mode, file_name, iml_rendering_mode, update_ambiguous_text_font, update_created_time_property, update_fields, update_last_printed_property, update_last_saved_time_property, zip_output, color_mode, jpeg_quality, metafile_rendering_options, numeral_format, optimize_output, page_count, page_index, bookmarks_outline_level, compression_level, digital_signature_details, headings_outline_levels, outline_options, use_book_fold_printing_settings, save_format].hash
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
      raise ArgumentError, 'Property file_name in XpsSaveOptionsData is required.' if self.file_name.nil?
      unless self.custom_time_zone_info_data.nil?
          self.custom_time_zone_info_data.validate
      end
      unless self.metafile_rendering_options.nil?
          self.metafile_rendering_options.validate
      end
      unless self.digital_signature_details.nil?
          self.digital_signature_details.validate
      end
      unless self.outline_options.nil?
          self.outline_options.validate
      end

    end

  end
end
