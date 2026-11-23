# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="page_setup.rb">
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

  # Represents the page setup properties of a section.
  # PageSetup object contains all the page setup attributes of a section (left margin, bottom margin, paper size, and so on) as properties.
  class PageSetup
    # Gets or sets the link to the document.
    attr_accessor :link


    # Gets or sets a value indicating whether this section contains bidirectional (complex scripts) text.
    # When true, the columns in this section are laid out from right to left.
    attr_accessor :bidi


    # Gets or sets a value indicating whether the page border is positioned relative to intersecting texts and objects.
    attr_accessor :border_always_in_front


    # Gets or sets the option that controls which pages the page border is printed on.
    attr_reader :border_applies_to


    # Gets or sets the value, that indicates whether the specified page border is measured from the edge of the page or from the text it surrounds.
    attr_reader :border_distance_from


    # Gets or sets the distance (in points) between the bottom edge of the page and the bottom boundary of the body text.
    attr_accessor :bottom_margin


    # Gets or sets a value indicating whether a different header or footer is used on the first page.
    attr_accessor :different_first_page_header_footer


    # Gets or sets the paper tray (bin) to use for the first page of a section.
    # The value is implementation (printer) specific.
    attr_accessor :first_page_tray


    # Gets or sets the distance (in points) between the footer and the bottom of the page.
    attr_accessor :footer_distance


    # Gets or sets the amount of extra space added to the margin for document binding.
    attr_accessor :gutter


    # Gets or sets the distance (in points) between the header and the top of the page.
    attr_accessor :header_distance


    # Gets or sets the distance (in points) between the left edge of the page and the left boundary of the body text.
    attr_accessor :left_margin


    # Gets or sets the numeric increment for line numbers.
    attr_accessor :line_number_count_by


    # Gets or sets the distance between the right edge of line numbers and the left edge of the document.
    # Set this property to zero for automatic distance between the line numbers and text of the document.
    attr_accessor :line_number_distance_from_text


    # Gets or sets the way line numbering runs  that is, whether it starts over at the beginning of a new page or section or runs continuously.
    attr_reader :line_number_restart_mode


    # Gets or sets the starting line number.
    attr_accessor :line_starting_number


    # Gets or sets the orientation of the page.
    # Changing Orientation swaps PageWidth and PageHeight.
    attr_reader :orientation


    # Gets or sets the paper tray (bin) to be used for all but the first page of a section.
    # The value is implementation (printer) specific.
    attr_accessor :other_pages_tray


    # Gets or sets the height of the page in points.
    attr_accessor :page_height


    # Gets or sets the page number format.
    attr_reader :page_number_style


    # Gets or sets the starting page number of the section.
    # The RestartPageNumbering property, if set to false, will override the PageStartingNumber property so that page numbering can continue from the previous section.
    attr_accessor :page_starting_number


    # Gets or sets the width of the page in points.
    attr_accessor :page_width


    # Gets or sets the paper size.
    # Setting this property updates PageWidth and PageHeight values. Setting this value to Custom does not change existing values.
    attr_reader :paper_size


    # Gets or sets a value indicating whether page numbering restarts at the beginning of the section.
    # If set to false, the RestartPageNumbering property will override the PageStartingNumber property so that page numbering can continue from the previous section.
    attr_accessor :restart_page_numbering


    # Gets or sets the distance (in points) between the right edge of the page and the right boundary of the body text.
    attr_accessor :right_margin


    # Gets or sets a value indicating whether Microsoft Word uses gutters for the section based on a right-to-left language or a left-to-right language.
    attr_accessor :rtl_gutter


    # Gets or sets the type of section break for the specified object.
    attr_reader :section_start


    # Gets or sets a value indicating whether endnotes are printed at the end of the next section that doesn't suppress endnotes. Suppressed endnotes are printed before the endnotes in that section.
    attr_accessor :suppress_endnotes


    # Gets or sets the distance (in points) between the top edge of the page and the top boundary of the body text.
    attr_accessor :top_margin


    # Gets or sets the vertical alignment of text on each page in the document.or section.
    attr_reader :vertical_alignment


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
        :'bidi' => :'Bidi',
        :'border_always_in_front' => :'BorderAlwaysInFront',
        :'border_applies_to' => :'BorderAppliesTo',
        :'border_distance_from' => :'BorderDistanceFrom',
        :'bottom_margin' => :'BottomMargin',
        :'different_first_page_header_footer' => :'DifferentFirstPageHeaderFooter',
        :'first_page_tray' => :'FirstPageTray',
        :'footer_distance' => :'FooterDistance',
        :'gutter' => :'Gutter',
        :'header_distance' => :'HeaderDistance',
        :'left_margin' => :'LeftMargin',
        :'line_number_count_by' => :'LineNumberCountBy',
        :'line_number_distance_from_text' => :'LineNumberDistanceFromText',
        :'line_number_restart_mode' => :'LineNumberRestartMode',
        :'line_starting_number' => :'LineStartingNumber',
        :'orientation' => :'Orientation',
        :'other_pages_tray' => :'OtherPagesTray',
        :'page_height' => :'PageHeight',
        :'page_number_style' => :'PageNumberStyle',
        :'page_starting_number' => :'PageStartingNumber',
        :'page_width' => :'PageWidth',
        :'paper_size' => :'PaperSize',
        :'restart_page_numbering' => :'RestartPageNumbering',
        :'right_margin' => :'RightMargin',
        :'rtl_gutter' => :'RtlGutter',
        :'section_start' => :'SectionStart',
        :'suppress_endnotes' => :'SuppressEndnotes',
        :'top_margin' => :'TopMargin',
        :'vertical_alignment' => :'VerticalAlignment'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'link' => :'WordsApiLink',
        :'bidi' => :'BOOLEAN',
        :'border_always_in_front' => :'BOOLEAN',
        :'border_applies_to' => :'String',
        :'border_distance_from' => :'String',
        :'bottom_margin' => :'Float',
        :'different_first_page_header_footer' => :'BOOLEAN',
        :'first_page_tray' => :'Integer',
        :'footer_distance' => :'Float',
        :'gutter' => :'Float',
        :'header_distance' => :'Float',
        :'left_margin' => :'Float',
        :'line_number_count_by' => :'Integer',
        :'line_number_distance_from_text' => :'Float',
        :'line_number_restart_mode' => :'String',
        :'line_starting_number' => :'Integer',
        :'orientation' => :'String',
        :'other_pages_tray' => :'Integer',
        :'page_height' => :'Float',
        :'page_number_style' => :'String',
        :'page_starting_number' => :'Integer',
        :'page_width' => :'Float',
        :'paper_size' => :'String',
        :'restart_page_numbering' => :'BOOLEAN',
        :'right_margin' => :'Float',
        :'rtl_gutter' => :'BOOLEAN',
        :'section_start' => :'String',
        :'suppress_endnotes' => :'BOOLEAN',
        :'top_margin' => :'Float',
        :'vertical_alignment' => :'String'
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

      if attributes.key?(:'Bidi')
        self.bidi = attributes[:'Bidi']
      end

      if attributes.key?(:'BorderAlwaysInFront')
        self.border_always_in_front = attributes[:'BorderAlwaysInFront']
      end

      if attributes.key?(:'BorderAppliesTo')
        self.border_applies_to = attributes[:'BorderAppliesTo']
      end

      if attributes.key?(:'BorderDistanceFrom')
        self.border_distance_from = attributes[:'BorderDistanceFrom']
      end

      if attributes.key?(:'BottomMargin')
        self.bottom_margin = attributes[:'BottomMargin']
      end

      if attributes.key?(:'DifferentFirstPageHeaderFooter')
        self.different_first_page_header_footer = attributes[:'DifferentFirstPageHeaderFooter']
      end

      if attributes.key?(:'FirstPageTray')
        self.first_page_tray = attributes[:'FirstPageTray']
      end

      if attributes.key?(:'FooterDistance')
        self.footer_distance = attributes[:'FooterDistance']
      end

      if attributes.key?(:'Gutter')
        self.gutter = attributes[:'Gutter']
      end

      if attributes.key?(:'HeaderDistance')
        self.header_distance = attributes[:'HeaderDistance']
      end

      if attributes.key?(:'LeftMargin')
        self.left_margin = attributes[:'LeftMargin']
      end

      if attributes.key?(:'LineNumberCountBy')
        self.line_number_count_by = attributes[:'LineNumberCountBy']
      end

      if attributes.key?(:'LineNumberDistanceFromText')
        self.line_number_distance_from_text = attributes[:'LineNumberDistanceFromText']
      end

      if attributes.key?(:'LineNumberRestartMode')
        self.line_number_restart_mode = attributes[:'LineNumberRestartMode']
      end

      if attributes.key?(:'LineStartingNumber')
        self.line_starting_number = attributes[:'LineStartingNumber']
      end

      if attributes.key?(:'Orientation')
        self.orientation = attributes[:'Orientation']
      end

      if attributes.key?(:'OtherPagesTray')
        self.other_pages_tray = attributes[:'OtherPagesTray']
      end

      if attributes.key?(:'PageHeight')
        self.page_height = attributes[:'PageHeight']
      end

      if attributes.key?(:'PageNumberStyle')
        self.page_number_style = attributes[:'PageNumberStyle']
      end

      if attributes.key?(:'PageStartingNumber')
        self.page_starting_number = attributes[:'PageStartingNumber']
      end

      if attributes.key?(:'PageWidth')
        self.page_width = attributes[:'PageWidth']
      end

      if attributes.key?(:'PaperSize')
        self.paper_size = attributes[:'PaperSize']
      end

      if attributes.key?(:'RestartPageNumbering')
        self.restart_page_numbering = attributes[:'RestartPageNumbering']
      end

      if attributes.key?(:'RightMargin')
        self.right_margin = attributes[:'RightMargin']
      end

      if attributes.key?(:'RtlGutter')
        self.rtl_gutter = attributes[:'RtlGutter']
      end

      if attributes.key?(:'SectionStart')
        self.section_start = attributes[:'SectionStart']
      end

      if attributes.key?(:'SuppressEndnotes')
        self.suppress_endnotes = attributes[:'SuppressEndnotes']
      end

      if attributes.key?(:'TopMargin')
        self.top_margin = attributes[:'TopMargin']
      end

      if attributes.key?(:'VerticalAlignment')
        self.vertical_alignment = attributes[:'VerticalAlignment']
      end
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      border_applies_to_validator = EnumAttributeValidator.new('String', ["AllPages", "FirstPage", "OtherPages"])
      return false unless border_applies_to_validator.valid?(@border_applies_to)
      border_distance_from_validator = EnumAttributeValidator.new('String', ["Text", "PageEdge"])
      return false unless border_distance_from_validator.valid?(@border_distance_from)
      line_number_restart_mode_validator = EnumAttributeValidator.new('String', ["RestartPage", "RestartSection", "Continuous"])
      return false unless line_number_restart_mode_validator.valid?(@line_number_restart_mode)
      orientation_validator = EnumAttributeValidator.new('String', ["Portrait", "Landscape"])
      return false unless orientation_validator.valid?(@orientation)
      page_number_style_validator = EnumAttributeValidator.new('String', ["Arabic", "UppercaseRoman", "LowercaseRoman", "UppercaseLetter", "LowercaseLetter", "Ordinal", "Number", "OrdinalText", "Hex", "ChicagoManual", "Kanji", "KanjiDigit", "AiueoHalfWidth", "IrohaHalfWidth", "ArabicFullWidth", "ArabicHalfWidth", "KanjiTraditional", "KanjiTraditional2", "NumberInCircle", "DecimalFullWidth", "Aiueo", "Iroha", "LeadingZero", "Bullet", "Ganada", "Chosung", "GB1", "GB2", "GB3", "GB4", "Zodiac1", "Zodiac2", "Zodiac3", "TradChinNum1", "TradChinNum2", "TradChinNum3", "TradChinNum4", "SimpChinNum1", "SimpChinNum2", "SimpChinNum3", "SimpChinNum4", "HanjaRead", "HanjaReadDigit", "Hangul", "Hanja", "Hebrew1", "Arabic1", "Hebrew2", "Arabic2", "HindiLetter1", "HindiLetter2", "HindiArabic", "HindiCardinalText", "ThaiLetter", "ThaiArabic", "ThaiCardinalText", "VietCardinalText", "NumberInDash", "LowercaseRussian", "UppercaseRussian", "None", "Custom"])
      return false unless page_number_style_validator.valid?(@page_number_style)
      paper_size_validator = EnumAttributeValidator.new('String', ["A3", "A4", "A5", "B4", "B5", "Executive", "Folio", "Ledger", "Legal", "Letter", "EnvelopeDL", "Quarto", "Statement", "Tabloid", "Paper10x14", "Paper11x17", "Number10Envelope", "JisB4", "JisB5", "Custom"])
      return false unless paper_size_validator.valid?(@paper_size)
      section_start_validator = EnumAttributeValidator.new('String', ["Continuous", "NewColumn", "NewPage", "EvenPage", "OddPage"])
      return false unless section_start_validator.valid?(@section_start)
      vertical_alignment_validator = EnumAttributeValidator.new('String', ["Top", "Center", "Justify", "Bottom"])
      return false unless vertical_alignment_validator.valid?(@vertical_alignment)

      return true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] border_applies_to Object to be assigned
    def border_applies_to=(border_applies_to)
      validator = EnumAttributeValidator.new('String', ["AllPages", "FirstPage", "OtherPages"])
      if border_applies_to.to_i == 0
        unless validator.valid?(border_applies_to)
          raise ArgumentError, "invalid value for 'border_applies_to', must be one of #{validator.allowable_values}."
        end
        @border_applies_to = border_applies_to
      else
        @border_applies_to = validator.allowable_values[border_applies_to.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] border_distance_from Object to be assigned
    def border_distance_from=(border_distance_from)
      validator = EnumAttributeValidator.new('String', ["Text", "PageEdge"])
      if border_distance_from.to_i == 0
        unless validator.valid?(border_distance_from)
          raise ArgumentError, "invalid value for 'border_distance_from', must be one of #{validator.allowable_values}."
        end
        @border_distance_from = border_distance_from
      else
        @border_distance_from = validator.allowable_values[border_distance_from.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] line_number_restart_mode Object to be assigned
    def line_number_restart_mode=(line_number_restart_mode)
      validator = EnumAttributeValidator.new('String', ["RestartPage", "RestartSection", "Continuous"])
      if line_number_restart_mode.to_i == 0
        unless validator.valid?(line_number_restart_mode)
          raise ArgumentError, "invalid value for 'line_number_restart_mode', must be one of #{validator.allowable_values}."
        end
        @line_number_restart_mode = line_number_restart_mode
      else
        @line_number_restart_mode = validator.allowable_values[line_number_restart_mode.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] orientation Object to be assigned
    def orientation=(orientation)
      validator = EnumAttributeValidator.new('String', ["Portrait", "Landscape"])
      if orientation.to_i == 0
        unless validator.valid?(orientation)
          raise ArgumentError, "invalid value for 'orientation', must be one of #{validator.allowable_values}."
        end
        @orientation = orientation
      else
        @orientation = validator.allowable_values[orientation.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] page_number_style Object to be assigned
    def page_number_style=(page_number_style)
      validator = EnumAttributeValidator.new('String', ["Arabic", "UppercaseRoman", "LowercaseRoman", "UppercaseLetter", "LowercaseLetter", "Ordinal", "Number", "OrdinalText", "Hex", "ChicagoManual", "Kanji", "KanjiDigit", "AiueoHalfWidth", "IrohaHalfWidth", "ArabicFullWidth", "ArabicHalfWidth", "KanjiTraditional", "KanjiTraditional2", "NumberInCircle", "DecimalFullWidth", "Aiueo", "Iroha", "LeadingZero", "Bullet", "Ganada", "Chosung", "GB1", "GB2", "GB3", "GB4", "Zodiac1", "Zodiac2", "Zodiac3", "TradChinNum1", "TradChinNum2", "TradChinNum3", "TradChinNum4", "SimpChinNum1", "SimpChinNum2", "SimpChinNum3", "SimpChinNum4", "HanjaRead", "HanjaReadDigit", "Hangul", "Hanja", "Hebrew1", "Arabic1", "Hebrew2", "Arabic2", "HindiLetter1", "HindiLetter2", "HindiArabic", "HindiCardinalText", "ThaiLetter", "ThaiArabic", "ThaiCardinalText", "VietCardinalText", "NumberInDash", "LowercaseRussian", "UppercaseRussian", "None", "Custom"])
      if page_number_style.to_i == 0
        unless validator.valid?(page_number_style)
          raise ArgumentError, "invalid value for 'page_number_style', must be one of #{validator.allowable_values}."
        end
        @page_number_style = page_number_style
      else
        @page_number_style = validator.allowable_values[page_number_style.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] paper_size Object to be assigned
    def paper_size=(paper_size)
      validator = EnumAttributeValidator.new('String', ["A3", "A4", "A5", "B4", "B5", "Executive", "Folio", "Ledger", "Legal", "Letter", "EnvelopeDL", "Quarto", "Statement", "Tabloid", "Paper10x14", "Paper11x17", "Number10Envelope", "JisB4", "JisB5", "Custom"])
      if paper_size.to_i == 0
        unless validator.valid?(paper_size)
          raise ArgumentError, "invalid value for 'paper_size', must be one of #{validator.allowable_values}."
        end
        @paper_size = paper_size
      else
        @paper_size = validator.allowable_values[paper_size.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] section_start Object to be assigned
    def section_start=(section_start)
      validator = EnumAttributeValidator.new('String', ["Continuous", "NewColumn", "NewPage", "EvenPage", "OddPage"])
      if section_start.to_i == 0
        unless validator.valid?(section_start)
          raise ArgumentError, "invalid value for 'section_start', must be one of #{validator.allowable_values}."
        end
        @section_start = section_start
      else
        @section_start = validator.allowable_values[section_start.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] vertical_alignment Object to be assigned
    def vertical_alignment=(vertical_alignment)
      validator = EnumAttributeValidator.new('String', ["Top", "Center", "Justify", "Bottom"])
      if vertical_alignment.to_i == 0
        unless validator.valid?(vertical_alignment)
          raise ArgumentError, "invalid value for 'vertical_alignment', must be one of #{validator.allowable_values}."
        end
        @vertical_alignment = vertical_alignment
      else
        @vertical_alignment = validator.allowable_values[vertical_alignment.to_i]
      end
    end


    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(other)
      return true if self.equal?(other)
      self.class == other.class &&
          link == other.link &&
          bidi == other.bidi &&
          border_always_in_front == other.border_always_in_front &&
          border_applies_to == other.border_applies_to &&
          border_distance_from == other.border_distance_from &&
          bottom_margin == other.bottom_margin &&
          different_first_page_header_footer == other.different_first_page_header_footer &&
          first_page_tray == other.first_page_tray &&
          footer_distance == other.footer_distance &&
          gutter == other.gutter &&
          header_distance == other.header_distance &&
          left_margin == other.left_margin &&
          line_number_count_by == other.line_number_count_by &&
          line_number_distance_from_text == other.line_number_distance_from_text &&
          line_number_restart_mode == other.line_number_restart_mode &&
          line_starting_number == other.line_starting_number &&
          orientation == other.orientation &&
          other_pages_tray == other.other_pages_tray &&
          page_height == other.page_height &&
          page_number_style == other.page_number_style &&
          page_starting_number == other.page_starting_number &&
          page_width == other.page_width &&
          paper_size == other.paper_size &&
          restart_page_numbering == other.restart_page_numbering &&
          right_margin == other.right_margin &&
          rtl_gutter == other.rtl_gutter &&
          section_start == other.section_start &&
          suppress_endnotes == other.suppress_endnotes &&
          top_margin == other.top_margin &&
          vertical_alignment == other.vertical_alignment
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [link, bidi, border_always_in_front, border_applies_to, border_distance_from, bottom_margin, different_first_page_header_footer, first_page_tray, footer_distance, gutter, header_distance, left_margin, line_number_count_by, line_number_distance_from_text, line_number_restart_mode, line_starting_number, orientation, other_pages_tray, page_height, page_number_style, page_starting_number, page_width, paper_size, restart_page_numbering, right_margin, rtl_gutter, section_start, suppress_endnotes, top_margin, vertical_alignment].hash
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

    end

  end
end
