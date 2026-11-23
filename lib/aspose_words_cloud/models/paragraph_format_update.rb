# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="paragraph_format_update.rb">
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

  # Paragraph format element update DTO.
  class ParagraphFormatUpdate
    # Gets or sets the link to the document.
    attr_accessor :link


    # Gets or sets a value indicating whether inter-character spacing is automatically adjusted between regions of Latin text and regions of East Asian text in the current paragraph.
    attr_accessor :add_space_between_far_east_and_alpha


    # Gets or sets a value indicating whether inter-character spacing is automatically adjusted between regions of numbers and regions of East Asian text in the current paragraph.
    attr_accessor :add_space_between_far_east_and_digit


    # Gets or sets text alignment for the paragraph.
    attr_reader :alignment


    # Gets or sets a value indicating whether this is a right-to-left paragraph.
    # When true, the runs and other inline objects in this paragraph are laid out right to left.
    attr_accessor :bidi


    # Gets or sets the position for a drop cap text.
    attr_reader :drop_cap_position


    # Gets or sets the value (in points) for a first line or hanging indent.
    # Use a positive value to set a first-line indent, and use a negative value to set a hanging indent.
    attr_accessor :first_line_indent


    # Gets or sets a value indicating whether all lines in the paragraph are to remain on the same page.
    attr_accessor :keep_together


    # Gets or sets a value indicating whether the paragraph is to remains on the same page as the paragraph that follows it.
    attr_accessor :keep_with_next


    # Gets or sets the value (in points), that represents the left indent for paragraph.
    attr_accessor :left_indent


    # Gets or sets the line spacing (in points) for the paragraph.
    # When LineSpacingRule property is set to AtLeast, the line spacing can be greater than or equal to, but never less than the specified LineSpacing value.When LineSpacingRule property is set to Exactly, the line spacing never changes from the specified LineSpacing value, even if a larger font is used within the paragraph.
    attr_accessor :line_spacing


    # Gets or sets the line spacing for the paragraph.
    attr_reader :line_spacing_rule


    # Gets or sets the number of lines of the paragraph text used to calculate the drop cap height.
    attr_accessor :lines_to_drop


    # Gets or sets a value indicating whether SpaceBefore and SpaceAfter will be ignored between the paragraphs of the same style.
    # This setting only takes affect when applied to a paragraph style. If applied to a paragraph directly, it has no effect.
    attr_accessor :no_space_between_paragraphs_of_same_style


    # Gets or sets the outline level of the paragraph in the document.
    attr_reader :outline_level


    # Gets or sets a value indicating whether a page break is forced before the paragraph.
    attr_accessor :page_break_before


    # Gets or sets the value (in points) that represents the right indent for paragraph.
    attr_accessor :right_indent


    # Gets or sets the amount of spacing (in points) after the paragraph.
    # Has no effect when SpaceAfterAuto is true.
    attr_accessor :space_after


    # Gets or sets a value indicating whether the amount of spacing after the paragraph is set automatically.
    # When set to true, overrides the effect of SpaceAfter.
    attr_accessor :space_after_auto


    # Gets or sets the amount of spacing (in points) before the paragraph.
    # Has no effect when SpaceBeforeAuto is true.
    attr_accessor :space_before


    # Gets or sets a value indicating whether the amount of spacing before the paragraph is set automatically.
    # When set to true, overrides the effect of SpaceBefore.
    attr_accessor :space_before_auto


    # Gets or sets the locale independent style identifier of the paragraph style applied to this formatting.
    attr_reader :style_identifier


    # Gets or sets the name of the paragraph style applied to this formatting.
    attr_accessor :style_name


    # Gets or sets a value indicating whether the current paragraph should be exempted from any hyphenation which is applied in the document settings.
    attr_accessor :suppress_auto_hyphens


    # Gets or sets a value indicating whether the current paragraph's lines should be exempted from line numbering which is applied in the parent section.
    attr_accessor :suppress_line_numbers


    # Gets or sets a value indicating whether the first and last lines in the paragraph are to remain on the same page as the rest of the paragraph.
    attr_accessor :widow_control


    # Gets or sets the Shading object, that refers to the shading formatting for the paragraph.
    attr_accessor :shading


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
        :'add_space_between_far_east_and_alpha' => :'AddSpaceBetweenFarEastAndAlpha',
        :'add_space_between_far_east_and_digit' => :'AddSpaceBetweenFarEastAndDigit',
        :'alignment' => :'Alignment',
        :'bidi' => :'Bidi',
        :'drop_cap_position' => :'DropCapPosition',
        :'first_line_indent' => :'FirstLineIndent',
        :'keep_together' => :'KeepTogether',
        :'keep_with_next' => :'KeepWithNext',
        :'left_indent' => :'LeftIndent',
        :'line_spacing' => :'LineSpacing',
        :'line_spacing_rule' => :'LineSpacingRule',
        :'lines_to_drop' => :'LinesToDrop',
        :'no_space_between_paragraphs_of_same_style' => :'NoSpaceBetweenParagraphsOfSameStyle',
        :'outline_level' => :'OutlineLevel',
        :'page_break_before' => :'PageBreakBefore',
        :'right_indent' => :'RightIndent',
        :'space_after' => :'SpaceAfter',
        :'space_after_auto' => :'SpaceAfterAuto',
        :'space_before' => :'SpaceBefore',
        :'space_before_auto' => :'SpaceBeforeAuto',
        :'style_identifier' => :'StyleIdentifier',
        :'style_name' => :'StyleName',
        :'suppress_auto_hyphens' => :'SuppressAutoHyphens',
        :'suppress_line_numbers' => :'SuppressLineNumbers',
        :'widow_control' => :'WidowControl',
        :'shading' => :'Shading'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'link' => :'WordsApiLink',
        :'add_space_between_far_east_and_alpha' => :'BOOLEAN',
        :'add_space_between_far_east_and_digit' => :'BOOLEAN',
        :'alignment' => :'String',
        :'bidi' => :'BOOLEAN',
        :'drop_cap_position' => :'String',
        :'first_line_indent' => :'Float',
        :'keep_together' => :'BOOLEAN',
        :'keep_with_next' => :'BOOLEAN',
        :'left_indent' => :'Float',
        :'line_spacing' => :'Float',
        :'line_spacing_rule' => :'String',
        :'lines_to_drop' => :'Integer',
        :'no_space_between_paragraphs_of_same_style' => :'BOOLEAN',
        :'outline_level' => :'String',
        :'page_break_before' => :'BOOLEAN',
        :'right_indent' => :'Float',
        :'space_after' => :'Float',
        :'space_after_auto' => :'BOOLEAN',
        :'space_before' => :'Float',
        :'space_before_auto' => :'BOOLEAN',
        :'style_identifier' => :'String',
        :'style_name' => :'String',
        :'suppress_auto_hyphens' => :'BOOLEAN',
        :'suppress_line_numbers' => :'BOOLEAN',
        :'widow_control' => :'BOOLEAN',
        :'shading' => :'Shading'
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

      if attributes.key?(:'AddSpaceBetweenFarEastAndAlpha')
        self.add_space_between_far_east_and_alpha = attributes[:'AddSpaceBetweenFarEastAndAlpha']
      end

      if attributes.key?(:'AddSpaceBetweenFarEastAndDigit')
        self.add_space_between_far_east_and_digit = attributes[:'AddSpaceBetweenFarEastAndDigit']
      end

      if attributes.key?(:'Alignment')
        self.alignment = attributes[:'Alignment']
      end

      if attributes.key?(:'Bidi')
        self.bidi = attributes[:'Bidi']
      end

      if attributes.key?(:'DropCapPosition')
        self.drop_cap_position = attributes[:'DropCapPosition']
      end

      if attributes.key?(:'FirstLineIndent')
        self.first_line_indent = attributes[:'FirstLineIndent']
      end

      if attributes.key?(:'KeepTogether')
        self.keep_together = attributes[:'KeepTogether']
      end

      if attributes.key?(:'KeepWithNext')
        self.keep_with_next = attributes[:'KeepWithNext']
      end

      if attributes.key?(:'LeftIndent')
        self.left_indent = attributes[:'LeftIndent']
      end

      if attributes.key?(:'LineSpacing')
        self.line_spacing = attributes[:'LineSpacing']
      end

      if attributes.key?(:'LineSpacingRule')
        self.line_spacing_rule = attributes[:'LineSpacingRule']
      end

      if attributes.key?(:'LinesToDrop')
        self.lines_to_drop = attributes[:'LinesToDrop']
      end

      if attributes.key?(:'NoSpaceBetweenParagraphsOfSameStyle')
        self.no_space_between_paragraphs_of_same_style = attributes[:'NoSpaceBetweenParagraphsOfSameStyle']
      end

      if attributes.key?(:'OutlineLevel')
        self.outline_level = attributes[:'OutlineLevel']
      end

      if attributes.key?(:'PageBreakBefore')
        self.page_break_before = attributes[:'PageBreakBefore']
      end

      if attributes.key?(:'RightIndent')
        self.right_indent = attributes[:'RightIndent']
      end

      if attributes.key?(:'SpaceAfter')
        self.space_after = attributes[:'SpaceAfter']
      end

      if attributes.key?(:'SpaceAfterAuto')
        self.space_after_auto = attributes[:'SpaceAfterAuto']
      end

      if attributes.key?(:'SpaceBefore')
        self.space_before = attributes[:'SpaceBefore']
      end

      if attributes.key?(:'SpaceBeforeAuto')
        self.space_before_auto = attributes[:'SpaceBeforeAuto']
      end

      if attributes.key?(:'StyleIdentifier')
        self.style_identifier = attributes[:'StyleIdentifier']
      end

      if attributes.key?(:'StyleName')
        self.style_name = attributes[:'StyleName']
      end

      if attributes.key?(:'SuppressAutoHyphens')
        self.suppress_auto_hyphens = attributes[:'SuppressAutoHyphens']
      end

      if attributes.key?(:'SuppressLineNumbers')
        self.suppress_line_numbers = attributes[:'SuppressLineNumbers']
      end

      if attributes.key?(:'WidowControl')
        self.widow_control = attributes[:'WidowControl']
      end

      if attributes.key?(:'Shading')
        self.shading = attributes[:'Shading']
      end
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      alignment_validator = EnumAttributeValidator.new('String', ["Left", "Center", "Right", "Justify", "Distributed", "ArabicMediumKashida", "ArabicHighKashida", "ArabicLowKashida", "ThaiDistributed", "MathElementCenterAsGroup"])
      return false unless alignment_validator.valid?(@alignment)
      drop_cap_position_validator = EnumAttributeValidator.new('String', ["None", "Normal", "Margin"])
      return false unless drop_cap_position_validator.valid?(@drop_cap_position)
      line_spacing_rule_validator = EnumAttributeValidator.new('String', ["AtLeast", "Exactly", "Multiple"])
      return false unless line_spacing_rule_validator.valid?(@line_spacing_rule)
      outline_level_validator = EnumAttributeValidator.new('String', ["Level1", "Level2", "Level3", "Level4", "Level5", "Level6", "Level7", "Level8", "Level9", "BodyText"])
      return false unless outline_level_validator.valid?(@outline_level)
      style_identifier_validator = EnumAttributeValidator.new('String', ["Normal", "Heading1", "Heading2", "Heading3", "Heading4", "Heading5", "Heading6", "Heading7", "Heading8", "Heading9", "Index1", "Index2", "Index3", "Index4", "Index5", "Index6", "Index7", "Index8", "Index9", "Toc1", "Toc2", "Toc3", "Toc4", "Toc5", "Toc6", "Toc7", "Toc8", "Toc9", "NormalIndent", "FootnoteText", "CommentText", "Header", "Footer", "IndexHeading", "Caption", "TableOfFigures", "EnvelopeAddress", "EnvelopeReturn", "FootnoteReference", "CommentReference", "LineNumber", "PageNumber", "EndnoteReference", "EndnoteText", "TableOfAuthorities", "Macro", "ToaHeading", "List", "ListBullet", "ListNumber", "List2", "List3", "List4", "List5", "ListBullet2", "ListBullet3", "ListBullet4", "ListBullet5", "ListNumber2", "ListNumber3", "ListNumber4", "ListNumber5", "Title", "Closing", "Signature", "DefaultParagraphFont", "BodyText", "BodyTextInd", "ListContinue", "ListContinue2", "ListContinue3", "ListContinue4", "ListContinue5", "MessageHeader", "Subtitle", "Salutation", "Date", "BodyText1I", "BodyText1I2", "NoteHeading", "BodyText2", "BodyText3", "BodyTextInd2", "BodyTextInd3", "BlockText", "Hyperlink", "FollowedHyperlink", "Strong", "Emphasis", "DocumentMap", "PlainText", "EmailSignature", "HtmlTopOfForm", "HtmlBottomOfForm", "NormalWeb", "HtmlAcronym", "HtmlAddress", "HtmlCite", "HtmlCode", "HtmlDefinition", "HtmlKeyboard", "HtmlPreformatted", "HtmlSample", "HtmlTypewriter", "HtmlVariable", "TableNormal", "CommentSubject", "NoList", "OutlineList1", "OutlineList2", "OutlineList3", "TableSimple1", "TableSimple2", "TableSimple3", "TableClassic1", "TableClassic2", "TableClassic3", "TableClassic4", "TableColorful1", "TableColorful2", "TableColorful3", "TableColumns1", "TableColumns2", "TableColumns3", "TableColumns4", "TableColumns5", "TableGrid1", "TableGrid2", "TableGrid3", "TableGrid4", "TableGrid5", "TableGrid6", "TableGrid7", "TableGrid8", "TableList1", "TableList2", "TableList3", "TableList4", "TableList5", "TableList6", "TableList7", "TableList8", "Table3DEffects1", "Table3DEffects2", "Table3DEffects3", "TableContemporary", "TableElegant", "TableProfessional", "TableSubtle1", "TableSubtle2", "TableWeb1", "TableWeb2", "TableWeb3", "BalloonText", "TableGrid", "TableTheme", "PlaceholderText", "NoSpacing", "LightShading", "LightList", "LightGrid", "MediumShading1", "MediumShading2", "MediumList1", "MediumList2", "MediumGrid1", "MediumGrid2", "MediumGrid3", "DarkList", "ColorfulShading", "ColorfulList", "ColorfulGrid", "LightShadingAccent1", "LightListAccent1", "LightGridAccent1", "MediumShading1Accent1", "MediumShading2Accent1", "MediumList1Accent1", "Revision", "ListParagraph", "Quote", "IntenseQuote", "MediumList2Accent1", "MediumGrid1Accent1", "MediumGrid2Accent1", "MediumGrid3Accent1", "DarkListAccent1", "ColorfulShadingAccent1", "ColorfulListAccent1", "ColorfulGridAccent1", "LightShadingAccent2", "LightListAccent2", "LightGridAccent2", "MediumShading1Accent2", "MediumShading2Accent2", "MediumList1Accent2", "MediumList2Accent2", "MediumGrid1Accent2", "MediumGrid2Accent2", "MediumGrid3Accent2", "DarkListAccent2", "ColorfulShadingAccent2", "ColorfulListAccent2", "ColorfulGridAccent2", "LightShadingAccent3", "LightListAccent3", "LightGridAccent3", "MediumShading1Accent3", "MediumShading2Accent3", "MediumList1Accent3", "MediumList2Accent3", "MediumGrid1Accent3", "MediumGrid2Accent3", "MediumGrid3Accent3", "DarkListAccent3", "ColorfulShadingAccent3", "ColorfulListAccent3", "ColorfulGridAccent3", "LightShadingAccent4", "LightListAccent4", "LightGridAccent4", "MediumShading1Accent4", "MediumShading2Accent4", "MediumList1Accent4", "MediumList2Accent4", "MediumGrid1Accent4", "MediumGrid2Accent4", "MediumGrid3Accent4", "DarkListAccent4", "ColorfulShadingAccent4", "ColorfulListAccent4", "ColorfulGridAccent4", "LightShadingAccent5", "LightListAccent5", "LightGridAccent5", "MediumShading1Accent5", "MediumShading2Accent5", "MediumList1Accent5", "MediumList2Accent5", "MediumGrid1Accent5", "MediumGrid2Accent5", "MediumGrid3Accent5", "DarkListAccent5", "ColorfulShadingAccent5", "ColorfulListAccent5", "ColorfulGridAccent5", "LightShadingAccent6", "LightListAccent6", "LightGridAccent6", "MediumShading1Accent6", "MediumShading2Accent6", "MediumList1Accent6", "MediumList2Accent6", "MediumGrid1Accent6", "MediumGrid2Accent6", "MediumGrid3Accent6", "DarkListAccent6", "ColorfulShadingAccent6", "ColorfulListAccent6", "ColorfulGridAccent6", "SubtleEmphasis", "IntenseEmphasis", "SubtleReference", "IntenseReference", "BookTitle", "Bibliography", "TocHeading", "PlainTable1", "PlainTable2", "PlainTable3", "PlainTable4", "PlainTable5", "TableGridLight", "GridTable1Light", "GridTable2", "GridTable3", "GridTable4", "GridTable5Dark", "GridTable6Colorful", "GridTable7Colorful", "GridTable1LightAccent1", "GridTable2Accent1", "GridTable3Accent1", "GridTable4Accent1", "GridTable5DarkAccent1", "GridTable6ColorfulAccent1", "GridTable7ColorfulAccent1", "GridTable1LightAccent2", "GridTable2Accent2", "GridTable3Accent2", "GridTable4Accent2", "GridTable5DarkAccent2", "GridTable6ColorfulAccent2", "GridTable7ColorfulAccent2", "GridTable1LightAccent3", "GridTable2Accent3", "GridTable3Accent3", "GridTable4Accent3", "GridTable5DarkAccent3", "GridTable6ColorfulAccent3", "GridTable7ColorfulAccent3", "GridTable1LightAccent4", "GridTable2Accent4", "GridTable3Accent4", "GridTable4Accent4", "GridTable5DarkAccent4", "GridTable6ColorfulAccent4", "GridTable7ColorfulAccent4", "GridTable1LightAccent5", "GridTable2Accent5", "GridTable3Accent5", "GridTable4Accent5", "GridTable5DarkAccent5", "GridTable6ColorfulAccent5", "GridTable7ColorfulAccent5", "GridTable1LightAccent6", "GridTable2Accent6", "GridTable3Accent6", "GridTable4Accent6", "GridTable5DarkAccent6", "GridTable6ColorfulAccent6", "GridTable7ColorfulAccent6", "ListTable1Light", "ListTable2", "ListTable3", "ListTable4", "ListTable5Dark", "ListTable6Colorful", "ListTable7Colorful", "ListTable1LightAccent1", "ListTable2Accent1", "ListTable3Accent1", "ListTable4Accent1", "ListTable5DarkAccent1", "ListTable6ColorfulAccent1", "ListTable7ColorfulAccent1", "ListTable1LightAccent2", "ListTable2Accent2", "ListTable3Accent2", "ListTable4Accent2", "ListTable5DarkAccent2", "ListTable6ColorfulAccent2", "ListTable7ColorfulAccent2", "ListTable1LightAccent3", "ListTable2Accent3", "ListTable3Accent3", "ListTable4Accent3", "ListTable5DarkAccent3", "ListTable6ColorfulAccent3", "ListTable7ColorfulAccent3", "ListTable1LightAccent4", "ListTable2Accent4", "ListTable3Accent4", "ListTable4Accent4", "ListTable5DarkAccent4", "ListTable6ColorfulAccent4", "ListTable7ColorfulAccent4", "ListTable1LightAccent5", "ListTable2Accent5", "ListTable3Accent5", "ListTable4Accent5", "ListTable5DarkAccent5", "ListTable6ColorfulAccent5", "ListTable7ColorfulAccent5", "ListTable1LightAccent6", "ListTable2Accent6", "ListTable3Accent6", "ListTable4Accent6", "ListTable5DarkAccent6", "ListTable6ColorfulAccent6", "ListTable7ColorfulAccent6", "SmartLink", "Mention", "SmartHyperlink", "Hashtag", "UnresolvedMention", "User", "Nil"])
      return false unless style_identifier_validator.valid?(@style_identifier)

      return true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] alignment Object to be assigned
    def alignment=(alignment)
      validator = EnumAttributeValidator.new('String', ["Left", "Center", "Right", "Justify", "Distributed", "ArabicMediumKashida", "ArabicHighKashida", "ArabicLowKashida", "ThaiDistributed", "MathElementCenterAsGroup"])
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
    # @param [Object] drop_cap_position Object to be assigned
    def drop_cap_position=(drop_cap_position)
      validator = EnumAttributeValidator.new('String', ["None", "Normal", "Margin"])
      if drop_cap_position.to_i == 0
        unless validator.valid?(drop_cap_position)
          raise ArgumentError, "invalid value for 'drop_cap_position', must be one of #{validator.allowable_values}."
        end
        @drop_cap_position = drop_cap_position
      else
        @drop_cap_position = validator.allowable_values[drop_cap_position.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] line_spacing_rule Object to be assigned
    def line_spacing_rule=(line_spacing_rule)
      validator = EnumAttributeValidator.new('String', ["AtLeast", "Exactly", "Multiple"])
      if line_spacing_rule.to_i == 0
        unless validator.valid?(line_spacing_rule)
          raise ArgumentError, "invalid value for 'line_spacing_rule', must be one of #{validator.allowable_values}."
        end
        @line_spacing_rule = line_spacing_rule
      else
        @line_spacing_rule = validator.allowable_values[line_spacing_rule.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] outline_level Object to be assigned
    def outline_level=(outline_level)
      validator = EnumAttributeValidator.new('String', ["Level1", "Level2", "Level3", "Level4", "Level5", "Level6", "Level7", "Level8", "Level9", "BodyText"])
      if outline_level.to_i == 0
        unless validator.valid?(outline_level)
          raise ArgumentError, "invalid value for 'outline_level', must be one of #{validator.allowable_values}."
        end
        @outline_level = outline_level
      else
        @outline_level = validator.allowable_values[outline_level.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] style_identifier Object to be assigned
    def style_identifier=(style_identifier)
      validator = EnumAttributeValidator.new('String', ["Normal", "Heading1", "Heading2", "Heading3", "Heading4", "Heading5", "Heading6", "Heading7", "Heading8", "Heading9", "Index1", "Index2", "Index3", "Index4", "Index5", "Index6", "Index7", "Index8", "Index9", "Toc1", "Toc2", "Toc3", "Toc4", "Toc5", "Toc6", "Toc7", "Toc8", "Toc9", "NormalIndent", "FootnoteText", "CommentText", "Header", "Footer", "IndexHeading", "Caption", "TableOfFigures", "EnvelopeAddress", "EnvelopeReturn", "FootnoteReference", "CommentReference", "LineNumber", "PageNumber", "EndnoteReference", "EndnoteText", "TableOfAuthorities", "Macro", "ToaHeading", "List", "ListBullet", "ListNumber", "List2", "List3", "List4", "List5", "ListBullet2", "ListBullet3", "ListBullet4", "ListBullet5", "ListNumber2", "ListNumber3", "ListNumber4", "ListNumber5", "Title", "Closing", "Signature", "DefaultParagraphFont", "BodyText", "BodyTextInd", "ListContinue", "ListContinue2", "ListContinue3", "ListContinue4", "ListContinue5", "MessageHeader", "Subtitle", "Salutation", "Date", "BodyText1I", "BodyText1I2", "NoteHeading", "BodyText2", "BodyText3", "BodyTextInd2", "BodyTextInd3", "BlockText", "Hyperlink", "FollowedHyperlink", "Strong", "Emphasis", "DocumentMap", "PlainText", "EmailSignature", "HtmlTopOfForm", "HtmlBottomOfForm", "NormalWeb", "HtmlAcronym", "HtmlAddress", "HtmlCite", "HtmlCode", "HtmlDefinition", "HtmlKeyboard", "HtmlPreformatted", "HtmlSample", "HtmlTypewriter", "HtmlVariable", "TableNormal", "CommentSubject", "NoList", "OutlineList1", "OutlineList2", "OutlineList3", "TableSimple1", "TableSimple2", "TableSimple3", "TableClassic1", "TableClassic2", "TableClassic3", "TableClassic4", "TableColorful1", "TableColorful2", "TableColorful3", "TableColumns1", "TableColumns2", "TableColumns3", "TableColumns4", "TableColumns5", "TableGrid1", "TableGrid2", "TableGrid3", "TableGrid4", "TableGrid5", "TableGrid6", "TableGrid7", "TableGrid8", "TableList1", "TableList2", "TableList3", "TableList4", "TableList5", "TableList6", "TableList7", "TableList8", "Table3DEffects1", "Table3DEffects2", "Table3DEffects3", "TableContemporary", "TableElegant", "TableProfessional", "TableSubtle1", "TableSubtle2", "TableWeb1", "TableWeb2", "TableWeb3", "BalloonText", "TableGrid", "TableTheme", "PlaceholderText", "NoSpacing", "LightShading", "LightList", "LightGrid", "MediumShading1", "MediumShading2", "MediumList1", "MediumList2", "MediumGrid1", "MediumGrid2", "MediumGrid3", "DarkList", "ColorfulShading", "ColorfulList", "ColorfulGrid", "LightShadingAccent1", "LightListAccent1", "LightGridAccent1", "MediumShading1Accent1", "MediumShading2Accent1", "MediumList1Accent1", "Revision", "ListParagraph", "Quote", "IntenseQuote", "MediumList2Accent1", "MediumGrid1Accent1", "MediumGrid2Accent1", "MediumGrid3Accent1", "DarkListAccent1", "ColorfulShadingAccent1", "ColorfulListAccent1", "ColorfulGridAccent1", "LightShadingAccent2", "LightListAccent2", "LightGridAccent2", "MediumShading1Accent2", "MediumShading2Accent2", "MediumList1Accent2", "MediumList2Accent2", "MediumGrid1Accent2", "MediumGrid2Accent2", "MediumGrid3Accent2", "DarkListAccent2", "ColorfulShadingAccent2", "ColorfulListAccent2", "ColorfulGridAccent2", "LightShadingAccent3", "LightListAccent3", "LightGridAccent3", "MediumShading1Accent3", "MediumShading2Accent3", "MediumList1Accent3", "MediumList2Accent3", "MediumGrid1Accent3", "MediumGrid2Accent3", "MediumGrid3Accent3", "DarkListAccent3", "ColorfulShadingAccent3", "ColorfulListAccent3", "ColorfulGridAccent3", "LightShadingAccent4", "LightListAccent4", "LightGridAccent4", "MediumShading1Accent4", "MediumShading2Accent4", "MediumList1Accent4", "MediumList2Accent4", "MediumGrid1Accent4", "MediumGrid2Accent4", "MediumGrid3Accent4", "DarkListAccent4", "ColorfulShadingAccent4", "ColorfulListAccent4", "ColorfulGridAccent4", "LightShadingAccent5", "LightListAccent5", "LightGridAccent5", "MediumShading1Accent5", "MediumShading2Accent5", "MediumList1Accent5", "MediumList2Accent5", "MediumGrid1Accent5", "MediumGrid2Accent5", "MediumGrid3Accent5", "DarkListAccent5", "ColorfulShadingAccent5", "ColorfulListAccent5", "ColorfulGridAccent5", "LightShadingAccent6", "LightListAccent6", "LightGridAccent6", "MediumShading1Accent6", "MediumShading2Accent6", "MediumList1Accent6", "MediumList2Accent6", "MediumGrid1Accent6", "MediumGrid2Accent6", "MediumGrid3Accent6", "DarkListAccent6", "ColorfulShadingAccent6", "ColorfulListAccent6", "ColorfulGridAccent6", "SubtleEmphasis", "IntenseEmphasis", "SubtleReference", "IntenseReference", "BookTitle", "Bibliography", "TocHeading", "PlainTable1", "PlainTable2", "PlainTable3", "PlainTable4", "PlainTable5", "TableGridLight", "GridTable1Light", "GridTable2", "GridTable3", "GridTable4", "GridTable5Dark", "GridTable6Colorful", "GridTable7Colorful", "GridTable1LightAccent1", "GridTable2Accent1", "GridTable3Accent1", "GridTable4Accent1", "GridTable5DarkAccent1", "GridTable6ColorfulAccent1", "GridTable7ColorfulAccent1", "GridTable1LightAccent2", "GridTable2Accent2", "GridTable3Accent2", "GridTable4Accent2", "GridTable5DarkAccent2", "GridTable6ColorfulAccent2", "GridTable7ColorfulAccent2", "GridTable1LightAccent3", "GridTable2Accent3", "GridTable3Accent3", "GridTable4Accent3", "GridTable5DarkAccent3", "GridTable6ColorfulAccent3", "GridTable7ColorfulAccent3", "GridTable1LightAccent4", "GridTable2Accent4", "GridTable3Accent4", "GridTable4Accent4", "GridTable5DarkAccent4", "GridTable6ColorfulAccent4", "GridTable7ColorfulAccent4", "GridTable1LightAccent5", "GridTable2Accent5", "GridTable3Accent5", "GridTable4Accent5", "GridTable5DarkAccent5", "GridTable6ColorfulAccent5", "GridTable7ColorfulAccent5", "GridTable1LightAccent6", "GridTable2Accent6", "GridTable3Accent6", "GridTable4Accent6", "GridTable5DarkAccent6", "GridTable6ColorfulAccent6", "GridTable7ColorfulAccent6", "ListTable1Light", "ListTable2", "ListTable3", "ListTable4", "ListTable5Dark", "ListTable6Colorful", "ListTable7Colorful", "ListTable1LightAccent1", "ListTable2Accent1", "ListTable3Accent1", "ListTable4Accent1", "ListTable5DarkAccent1", "ListTable6ColorfulAccent1", "ListTable7ColorfulAccent1", "ListTable1LightAccent2", "ListTable2Accent2", "ListTable3Accent2", "ListTable4Accent2", "ListTable5DarkAccent2", "ListTable6ColorfulAccent2", "ListTable7ColorfulAccent2", "ListTable1LightAccent3", "ListTable2Accent3", "ListTable3Accent3", "ListTable4Accent3", "ListTable5DarkAccent3", "ListTable6ColorfulAccent3", "ListTable7ColorfulAccent3", "ListTable1LightAccent4", "ListTable2Accent4", "ListTable3Accent4", "ListTable4Accent4", "ListTable5DarkAccent4", "ListTable6ColorfulAccent4", "ListTable7ColorfulAccent4", "ListTable1LightAccent5", "ListTable2Accent5", "ListTable3Accent5", "ListTable4Accent5", "ListTable5DarkAccent5", "ListTable6ColorfulAccent5", "ListTable7ColorfulAccent5", "ListTable1LightAccent6", "ListTable2Accent6", "ListTable3Accent6", "ListTable4Accent6", "ListTable5DarkAccent6", "ListTable6ColorfulAccent6", "ListTable7ColorfulAccent6", "SmartLink", "Mention", "SmartHyperlink", "Hashtag", "UnresolvedMention", "User", "Nil"])
      if style_identifier.to_i == 0
        unless validator.valid?(style_identifier)
          raise ArgumentError, "invalid value for 'style_identifier', must be one of #{validator.allowable_values}."
        end
        @style_identifier = style_identifier
      else
        @style_identifier = validator.allowable_values[style_identifier.to_i]
      end
    end


    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(other)
      return true if self.equal?(other)
      self.class == other.class &&
          link == other.link &&
          add_space_between_far_east_and_alpha == other.add_space_between_far_east_and_alpha &&
          add_space_between_far_east_and_digit == other.add_space_between_far_east_and_digit &&
          alignment == other.alignment &&
          bidi == other.bidi &&
          drop_cap_position == other.drop_cap_position &&
          first_line_indent == other.first_line_indent &&
          keep_together == other.keep_together &&
          keep_with_next == other.keep_with_next &&
          left_indent == other.left_indent &&
          line_spacing == other.line_spacing &&
          line_spacing_rule == other.line_spacing_rule &&
          lines_to_drop == other.lines_to_drop &&
          no_space_between_paragraphs_of_same_style == other.no_space_between_paragraphs_of_same_style &&
          outline_level == other.outline_level &&
          page_break_before == other.page_break_before &&
          right_indent == other.right_indent &&
          space_after == other.space_after &&
          space_after_auto == other.space_after_auto &&
          space_before == other.space_before &&
          space_before_auto == other.space_before_auto &&
          style_identifier == other.style_identifier &&
          style_name == other.style_name &&
          suppress_auto_hyphens == other.suppress_auto_hyphens &&
          suppress_line_numbers == other.suppress_line_numbers &&
          widow_control == other.widow_control &&
          shading == other.shading
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [link, add_space_between_far_east_and_alpha, add_space_between_far_east_and_digit, alignment, bidi, drop_cap_position, first_line_indent, keep_together, keep_with_next, left_indent, line_spacing, line_spacing_rule, lines_to_drop, no_space_between_paragraphs_of_same_style, outline_level, page_break_before, right_indent, space_after, space_after_auto, space_before, space_before_auto, style_identifier, style_name, suppress_auto_hyphens, suppress_line_numbers, widow_control, shading].hash
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
      unless self.shading.nil?
          self.shading.validate
      end

    end

  end
end
