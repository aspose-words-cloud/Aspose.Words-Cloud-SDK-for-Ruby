# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="structured_document_tag_update.rb">
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

  # DTO container with a StructuredDocumentTag.
  class StructuredDocumentTagUpdate
    # Gets or sets the link to the document.
    attr_accessor :link


    # Gets or sets the node id.
    attr_accessor :node_id


    # Gets or sets Aspose.Words.Markup.SdtListItemCollection associated with this SDT.
    # Accessing this property will work only for Aspose.Words.Markup.SdtType.ComboBox or Aspose.Words.Markup.SdtType.DropDownList SDT types.
    # For all other SDT types, an exception will occur.
    attr_accessor :list_items


    # Gets or sets a value indicating whether current state of the Checkbox SDT. Default value for this property.
    # Accessing this property will work only for Aspose.Words.Markup.SdtType.Checkbox SDT types.
    # For all other SDT types, an exception will occur.
    attr_accessor :checked


    # Gets or sets the appearance of a structured document tag.
    attr_reader :appearance


    # Gets or sets the language format for the date displayed in this SDT.
    # Accessing this property will work only for Aspose.Words.Markup.SdtType.Date SDT type.
    # For all other SDT types, an exception will occur.
    attr_accessor :date_display_locale


    # Gets or sets String that represents the format in which dates are displayed. Can not be null. The dates for English (U.S.) is "mm/dd/yyyy".
    # Accessing this property will work only for Aspose.Words.Markup.SdtType.Date SDT type.
    # For all other SDT types, an exception will occur.
    attr_accessor :date_display_format


    # Gets or sets the full date and time last entered into this SDT.
    # Accessing this property will work only for Aspose.Words.Markup.SdtType.Date SDT type.
    # For all other SDT types, an exception will occur.
    attr_accessor :full_date


    # Gets or sets the friendly name associated with this SDT. Can not be null.
    attr_accessor :title


    # Gets or sets format in which the date for a date SDT is stored when the SDT is bound to an XML node in the document's data store.
    # The default value is Aspose.Words.Markup.SdtDateStorageFormat.DateTime.
    # Accessing this property will work only for Aspose.Words.Markup.SdtType.Date SDT type.
    # For all other SDT types, an exception will occur.
    attr_reader :date_storage_format


    # Gets or sets type of building block for this SDT. Can not be null.
    # Accessing this property will work only for Aspose.Words.Markup.SdtType.BuildingBlockGallery and Aspose.Words.Markup.SdtType.DocPartObj SDT types.
    # It is read-only for SDT of the document part type.
    # For all other SDT types, an exception will occur.
    attr_accessor :building_block_gallery


    # Gets or sets category of building block for this SDT node. Can not be null.
    # Accessing this property will work only for Aspose.Words.Markup.SdtType.BuildingBlockGallery and Aspose.Words.Markup.SdtType.DocPartObj SDT types.
    # It is read-only for SDT of the document part type. For all other SDT types, an exception will occur.
    attr_accessor :building_block_category


    # Gets or sets a value indicating whether this SDT allows multiple lines of text.
    # Accessing this property will work only for Aspose.Words.Markup.SdtType.RichText and Aspose.Words.Markup.SdtType.PlainText SDT type.
    # For all other SDT types, an exception will occur.
    attr_accessor :multiline


    # Gets or sets the color of the structured document tag.
    attr_accessor :color


    # Gets or sets the name of the style applied to the structured document tag.
    attr_accessor :style_name


    # Gets or sets the type of calendar for this SDT. Default is Aspose.Words.Markup.SdtCalendarType.Default.
    # Accessing this property will work only for Aspose.Words.Markup.SdtType.Date SDT type.
    # For all other SDT types, an exception will occur.
    attr_reader :calendar_type


    # Gets or sets a value indicating whether this SDT shall be removed from the WordProcessingML document when its contents are modified.
    attr_accessor :is_temporary


    # Gets or sets Name of the Aspose.Words.BuildingBlocks.BuildingBlock containing placeholder text.
    # Aspose.Words.BuildingBlocks.BuildingBlock with this name Aspose.Words.BuildingBlocks.BuildingBlock.Name has to be present in the Aspose.Words.Document.GlossaryDocument otherwise System.InvalidOperationException will occur.
    attr_accessor :placeholder_name


    # Gets or sets a value indicating whether, this property will prohibit a user from deleting this SDT.
    attr_accessor :lock_content_control


    # Gets or sets a value indicating whether, this property will prohibit a user from editing the contents of this SDT.
    attr_accessor :lock_contents


    # Gets or sets a value indicating whether the content of this SDT shall be interpreted to contain placeholder text (as opposed to regular text contents within the SDT).
    # If set to true, this state shall be resumed (showing placeholder text) upon opening his document.
    attr_accessor :is_showing_placeholder_text


    # Gets or sets a tag associated with the current SDT node. Can not be null.
    # A tag is an arbitrary string which applications can associate with SDT in order to identify it without providing a visible friendly name.
    attr_accessor :tag


    # Gets or sets a unique read-only persistent numerical Id for this SDT.
    # Id attribute shall follow these rules:
    # - The document shall retain SDT ids only if the whole document is cloned Aspose.Words.Document.Clone.
    # - During Aspose.Words.DocumentBase.ImportNode(Aspose.Words.Node,System.Boolean)
    # - Id shall be retained if import does not cause conflicts with other SDT Ids in the target document.
    # - If multiple SDT nodes specify the same decimal number value for the Id attribute, then the first SDT in the document shall maintain this original Id, and all subsequent
    # - SDT nodes shall have new identifiers assigned to them when the document is loaded.
    # - During standalone SDT Aspose.Words.Markup.StructuredDocumentTag.Clone(System.Boolean,Aspose.Words.INodeCloningListener) operation new unique ID will be generated for the cloned SDT node.
    # - If Id is not specified in the source document, then the SDT node shall have a new unique identifier assigned to it when the document is loaded.
    attr_accessor :id


    # Gets a string that represents the XML contained within the node in the Aspose.Words.SaveFormat.FlatOpc format.
    attr_accessor :word_open_xml


    # Gets or sets the level at which this SDT occurs in the document tree.
    attr_reader :level


    # Gets or sets type of this Structured document tag.
    attr_reader :sdt_type


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
        :'list_items' => :'ListItems',
        :'checked' => :'Checked',
        :'appearance' => :'Appearance',
        :'date_display_locale' => :'DateDisplayLocale',
        :'date_display_format' => :'DateDisplayFormat',
        :'full_date' => :'FullDate',
        :'title' => :'Title',
        :'date_storage_format' => :'DateStorageFormat',
        :'building_block_gallery' => :'BuildingBlockGallery',
        :'building_block_category' => :'BuildingBlockCategory',
        :'multiline' => :'Multiline',
        :'color' => :'Color',
        :'style_name' => :'StyleName',
        :'calendar_type' => :'CalendarType',
        :'is_temporary' => :'IsTemporary',
        :'placeholder_name' => :'PlaceholderName',
        :'lock_content_control' => :'LockContentControl',
        :'lock_contents' => :'LockContents',
        :'is_showing_placeholder_text' => :'IsShowingPlaceholderText',
        :'tag' => :'Tag',
        :'id' => :'Id',
        :'word_open_xml' => :'WordOpenXML',
        :'level' => :'Level',
        :'sdt_type' => :'SdtType'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'link' => :'WordsApiLink',
        :'node_id' => :'String',
        :'list_items' => :'Array<StructuredDocumentTagListItem>',
        :'checked' => :'BOOLEAN',
        :'appearance' => :'String',
        :'date_display_locale' => :'Integer',
        :'date_display_format' => :'String',
        :'full_date' => :'DateTime',
        :'title' => :'String',
        :'date_storage_format' => :'String',
        :'building_block_gallery' => :'String',
        :'building_block_category' => :'String',
        :'multiline' => :'BOOLEAN',
        :'color' => :'XmlColor',
        :'style_name' => :'String',
        :'calendar_type' => :'String',
        :'is_temporary' => :'BOOLEAN',
        :'placeholder_name' => :'String',
        :'lock_content_control' => :'BOOLEAN',
        :'lock_contents' => :'BOOLEAN',
        :'is_showing_placeholder_text' => :'BOOLEAN',
        :'tag' => :'String',
        :'id' => :'Integer',
        :'word_open_xml' => :'String',
        :'level' => :'String',
        :'sdt_type' => :'String'
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

      if attributes.key?(:'ListItems')
        if (value = attributes[:'ListItems']).is_a?(Array)
          self.list_items = value
        end
      end

      if attributes.key?(:'Checked')
        self.checked = attributes[:'Checked']
      end

      if attributes.key?(:'Appearance')
        self.appearance = attributes[:'Appearance']
      end

      if attributes.key?(:'DateDisplayLocale')
        self.date_display_locale = attributes[:'DateDisplayLocale']
      end

      if attributes.key?(:'DateDisplayFormat')
        self.date_display_format = attributes[:'DateDisplayFormat']
      end

      if attributes.key?(:'FullDate')
        self.full_date = attributes[:'FullDate']
      end

      if attributes.key?(:'Title')
        self.title = attributes[:'Title']
      end

      if attributes.key?(:'DateStorageFormat')
        self.date_storage_format = attributes[:'DateStorageFormat']
      end

      if attributes.key?(:'BuildingBlockGallery')
        self.building_block_gallery = attributes[:'BuildingBlockGallery']
      end

      if attributes.key?(:'BuildingBlockCategory')
        self.building_block_category = attributes[:'BuildingBlockCategory']
      end

      if attributes.key?(:'Multiline')
        self.multiline = attributes[:'Multiline']
      end

      if attributes.key?(:'Color')
        self.color = attributes[:'Color']
      end

      if attributes.key?(:'StyleName')
        self.style_name = attributes[:'StyleName']
      end

      if attributes.key?(:'CalendarType')
        self.calendar_type = attributes[:'CalendarType']
      end

      if attributes.key?(:'IsTemporary')
        self.is_temporary = attributes[:'IsTemporary']
      end

      if attributes.key?(:'PlaceholderName')
        self.placeholder_name = attributes[:'PlaceholderName']
      end

      if attributes.key?(:'LockContentControl')
        self.lock_content_control = attributes[:'LockContentControl']
      end

      if attributes.key?(:'LockContents')
        self.lock_contents = attributes[:'LockContents']
      end

      if attributes.key?(:'IsShowingPlaceholderText')
        self.is_showing_placeholder_text = attributes[:'IsShowingPlaceholderText']
      end

      if attributes.key?(:'Tag')
        self.tag = attributes[:'Tag']
      end

      if attributes.key?(:'Id')
        self.id = attributes[:'Id']
      end

      if attributes.key?(:'Level')
        self.level = attributes[:'Level']
      end

      if attributes.key?(:'SdtType')
        self.sdt_type = attributes[:'SdtType']
      end
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      appearance_validator = EnumAttributeValidator.new('String', ["BoundingBox", "Default", "Tags", "Hidden"])
      return false unless appearance_validator.valid?(@appearance)
      date_storage_format_validator = EnumAttributeValidator.new('String', ["Date", "DateTime", "Default", "Text"])
      return false unless date_storage_format_validator.valid?(@date_storage_format)
      calendar_type_validator = EnumAttributeValidator.new('String', ["Default", "Gregorian", "GregorianArabic", "GregorianMeFrench", "GregorianUs", "GregorianXlitEnglish", "GregorianXlitFrench", "Hebrew", "Hijri", "Japan", "Korea", "None", "Saka", "Taiwan", "Thai"])
      return false unless calendar_type_validator.valid?(@calendar_type)
      level_validator = EnumAttributeValidator.new('String', ["Unknown", "Inline", "Block", "Row", "Cell"])
      return false unless level_validator.valid?(@level)
      sdt_type_validator = EnumAttributeValidator.new('String', ["None", "Bibliography", "Citation", "Equation", "DropDownList", "ComboBox", "Date", "BuildingBlockGallery", "DocPartObj", "Group", "Picture", "RichText", "PlainText", "Checkbox", "RepeatingSection", "RepeatingSectionItem", "EntityPicker"])
      return false unless sdt_type_validator.valid?(@sdt_type)

      return true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] appearance Object to be assigned
    def appearance=(appearance)
      validator = EnumAttributeValidator.new('String', ["BoundingBox", "Default", "Tags", "Hidden"])
      if appearance.to_i == 0
        unless validator.valid?(appearance)
          raise ArgumentError, "invalid value for 'appearance', must be one of #{validator.allowable_values}."
        end
        @appearance = appearance
      else
        @appearance = validator.allowable_values[appearance.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] date_storage_format Object to be assigned
    def date_storage_format=(date_storage_format)
      validator = EnumAttributeValidator.new('String', ["Date", "DateTime", "Default", "Text"])
      if date_storage_format.to_i == 0
        unless validator.valid?(date_storage_format)
          raise ArgumentError, "invalid value for 'date_storage_format', must be one of #{validator.allowable_values}."
        end
        @date_storage_format = date_storage_format
      else
        @date_storage_format = validator.allowable_values[date_storage_format.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] calendar_type Object to be assigned
    def calendar_type=(calendar_type)
      validator = EnumAttributeValidator.new('String', ["Default", "Gregorian", "GregorianArabic", "GregorianMeFrench", "GregorianUs", "GregorianXlitEnglish", "GregorianXlitFrench", "Hebrew", "Hijri", "Japan", "Korea", "None", "Saka", "Taiwan", "Thai"])
      if calendar_type.to_i == 0
        unless validator.valid?(calendar_type)
          raise ArgumentError, "invalid value for 'calendar_type', must be one of #{validator.allowable_values}."
        end
        @calendar_type = calendar_type
      else
        @calendar_type = validator.allowable_values[calendar_type.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] level Object to be assigned
    def level=(level)
      validator = EnumAttributeValidator.new('String', ["Unknown", "Inline", "Block", "Row", "Cell"])
      if level.to_i == 0
        unless validator.valid?(level)
          raise ArgumentError, "invalid value for 'level', must be one of #{validator.allowable_values}."
        end
        @level = level
      else
        @level = validator.allowable_values[level.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] sdt_type Object to be assigned
    def sdt_type=(sdt_type)
      validator = EnumAttributeValidator.new('String', ["None", "Bibliography", "Citation", "Equation", "DropDownList", "ComboBox", "Date", "BuildingBlockGallery", "DocPartObj", "Group", "Picture", "RichText", "PlainText", "Checkbox", "RepeatingSection", "RepeatingSectionItem", "EntityPicker"])
      if sdt_type.to_i == 0
        unless validator.valid?(sdt_type)
          raise ArgumentError, "invalid value for 'sdt_type', must be one of #{validator.allowable_values}."
        end
        @sdt_type = sdt_type
      else
        @sdt_type = validator.allowable_values[sdt_type.to_i]
      end
    end


    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(other)
      return true if self.equal?(other)
      self.class == other.class &&
          link == other.link &&
          node_id == other.node_id &&
          list_items == other.list_items &&
          checked == other.checked &&
          appearance == other.appearance &&
          date_display_locale == other.date_display_locale &&
          date_display_format == other.date_display_format &&
          full_date == other.full_date &&
          title == other.title &&
          date_storage_format == other.date_storage_format &&
          building_block_gallery == other.building_block_gallery &&
          building_block_category == other.building_block_category &&
          multiline == other.multiline &&
          color == other.color &&
          style_name == other.style_name &&
          calendar_type == other.calendar_type &&
          is_temporary == other.is_temporary &&
          placeholder_name == other.placeholder_name &&
          lock_content_control == other.lock_content_control &&
          lock_contents == other.lock_contents &&
          is_showing_placeholder_text == other.is_showing_placeholder_text &&
          tag == other.tag &&
          id == other.id &&
          word_open_xml == other.word_open_xml &&
          level == other.level &&
          sdt_type == other.sdt_type
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [link, node_id, list_items, checked, appearance, date_display_locale, date_display_format, full_date, title, date_storage_format, building_block_gallery, building_block_category, multiline, color, style_name, calendar_type, is_temporary, placeholder_name, lock_content_control, lock_contents, is_showing_placeholder_text, tag, id, word_open_xml, level, sdt_type].hash
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
      unless self.list_items.nil?
          for elementListItems in self.list_items
              unless elementListItems.nil?
                  elementListItems.validate
              end
          end
      end
      unless self.color.nil?
          self.color.validate
      end

    end

  end
end
