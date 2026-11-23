# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="table_properties.rb">
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

  # DTO container with table properties.
  class TableProperties
    # Gets or sets the link to the document.
    attr_accessor :link


    # Gets or sets the option that controls how an inline table is aligned in the document.
    # The default value is Left.
    attr_reader :alignment


    # Gets or sets a value indicating whether to automatically resize cells in a table to fit their contents.
    # The default value is true.
    attr_accessor :allow_auto_fit


    # Gets or sets a value indicating whether this is a right-to-left table.
    # When true, the cells in this row are laid out right to left.The default value is false.
    attr_accessor :bidi


    # Gets or sets the amount of space (in points) to add below the contents of cells.
    attr_accessor :bottom_padding


    # Gets or sets the amount of space (in points) between the cells.
    attr_accessor :cell_spacing


    # Gets or sets the value, that represents the left indent of the table.
    attr_accessor :left_indent


    # Gets or sets the amount of space (in points) to add to the left of the contents of cells.
    attr_accessor :left_padding


    # Gets or sets the table preferred width.
    # Preferred width can be specified as a percentage, number of points or a special "auto" value.
    attr_accessor :preferred_width


    # Gets or sets the amount of space (in points) to add to the right of the contents of cells.
    attr_accessor :right_padding


    # Gets or sets the locale independent style identifier of the table style applied to this table.
    attr_reader :style_identifier


    # Gets or sets the name of the table style applied to this table.
    attr_accessor :style_name


    # Gets or sets the bit flags, that specify how a table style is applied to this table.
    attr_reader :style_options


    # Gets or sets the option that controls text wrapping for the table.
    attr_reader :text_wrapping


    # Gets or sets the amount of space (in points) to add above the contents of cells.
    attr_accessor :top_padding


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
        :'alignment' => :'Alignment',
        :'allow_auto_fit' => :'AllowAutoFit',
        :'bidi' => :'Bidi',
        :'bottom_padding' => :'BottomPadding',
        :'cell_spacing' => :'CellSpacing',
        :'left_indent' => :'LeftIndent',
        :'left_padding' => :'LeftPadding',
        :'preferred_width' => :'PreferredWidth',
        :'right_padding' => :'RightPadding',
        :'style_identifier' => :'StyleIdentifier',
        :'style_name' => :'StyleName',
        :'style_options' => :'StyleOptions',
        :'text_wrapping' => :'TextWrapping',
        :'top_padding' => :'TopPadding'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'link' => :'WordsApiLink',
        :'alignment' => :'String',
        :'allow_auto_fit' => :'BOOLEAN',
        :'bidi' => :'BOOLEAN',
        :'bottom_padding' => :'Float',
        :'cell_spacing' => :'Float',
        :'left_indent' => :'Float',
        :'left_padding' => :'Float',
        :'preferred_width' => :'PreferredWidth',
        :'right_padding' => :'Float',
        :'style_identifier' => :'String',
        :'style_name' => :'String',
        :'style_options' => :'String',
        :'text_wrapping' => :'String',
        :'top_padding' => :'Float'
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

      if attributes.key?(:'Alignment')
        self.alignment = attributes[:'Alignment']
      end

      if attributes.key?(:'AllowAutoFit')
        self.allow_auto_fit = attributes[:'AllowAutoFit']
      end

      if attributes.key?(:'Bidi')
        self.bidi = attributes[:'Bidi']
      end

      if attributes.key?(:'BottomPadding')
        self.bottom_padding = attributes[:'BottomPadding']
      end

      if attributes.key?(:'CellSpacing')
        self.cell_spacing = attributes[:'CellSpacing']
      end

      if attributes.key?(:'LeftIndent')
        self.left_indent = attributes[:'LeftIndent']
      end

      if attributes.key?(:'LeftPadding')
        self.left_padding = attributes[:'LeftPadding']
      end

      if attributes.key?(:'PreferredWidth')
        self.preferred_width = attributes[:'PreferredWidth']
      end

      if attributes.key?(:'RightPadding')
        self.right_padding = attributes[:'RightPadding']
      end

      if attributes.key?(:'StyleIdentifier')
        self.style_identifier = attributes[:'StyleIdentifier']
      end

      if attributes.key?(:'StyleName')
        self.style_name = attributes[:'StyleName']
      end

      if attributes.key?(:'StyleOptions')
        self.style_options = attributes[:'StyleOptions']
      end

      if attributes.key?(:'TextWrapping')
        self.text_wrapping = attributes[:'TextWrapping']
      end

      if attributes.key?(:'TopPadding')
        self.top_padding = attributes[:'TopPadding']
      end
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      alignment_validator = EnumAttributeValidator.new('String', ["Left", "Center", "Right"])
      return false unless alignment_validator.valid?(@alignment)
      style_identifier_validator = EnumAttributeValidator.new('String', ["Normal", "Heading1", "Heading2", "Heading3", "Heading4", "Heading5", "Heading6", "Heading7", "Heading8", "Heading9", "Index1", "Index2", "Index3", "Index4", "Index5", "Index6", "Index7", "Index8", "Index9", "Toc1", "Toc2", "Toc3", "Toc4", "Toc5", "Toc6", "Toc7", "Toc8", "Toc9", "NormalIndent", "FootnoteText", "CommentText", "Header", "Footer", "IndexHeading", "Caption", "TableOfFigures", "EnvelopeAddress", "EnvelopeReturn", "FootnoteReference", "CommentReference", "LineNumber", "PageNumber", "EndnoteReference", "EndnoteText", "TableOfAuthorities", "Macro", "ToaHeading", "List", "ListBullet", "ListNumber", "List2", "List3", "List4", "List5", "ListBullet2", "ListBullet3", "ListBullet4", "ListBullet5", "ListNumber2", "ListNumber3", "ListNumber4", "ListNumber5", "Title", "Closing", "Signature", "DefaultParagraphFont", "BodyText", "BodyTextInd", "ListContinue", "ListContinue2", "ListContinue3", "ListContinue4", "ListContinue5", "MessageHeader", "Subtitle", "Salutation", "Date", "BodyText1I", "BodyText1I2", "NoteHeading", "BodyText2", "BodyText3", "BodyTextInd2", "BodyTextInd3", "BlockText", "Hyperlink", "FollowedHyperlink", "Strong", "Emphasis", "DocumentMap", "PlainText", "EmailSignature", "HtmlTopOfForm", "HtmlBottomOfForm", "NormalWeb", "HtmlAcronym", "HtmlAddress", "HtmlCite", "HtmlCode", "HtmlDefinition", "HtmlKeyboard", "HtmlPreformatted", "HtmlSample", "HtmlTypewriter", "HtmlVariable", "TableNormal", "CommentSubject", "NoList", "OutlineList1", "OutlineList2", "OutlineList3", "TableSimple1", "TableSimple2", "TableSimple3", "TableClassic1", "TableClassic2", "TableClassic3", "TableClassic4", "TableColorful1", "TableColorful2", "TableColorful3", "TableColumns1", "TableColumns2", "TableColumns3", "TableColumns4", "TableColumns5", "TableGrid1", "TableGrid2", "TableGrid3", "TableGrid4", "TableGrid5", "TableGrid6", "TableGrid7", "TableGrid8", "TableList1", "TableList2", "TableList3", "TableList4", "TableList5", "TableList6", "TableList7", "TableList8", "Table3DEffects1", "Table3DEffects2", "Table3DEffects3", "TableContemporary", "TableElegant", "TableProfessional", "TableSubtle1", "TableSubtle2", "TableWeb1", "TableWeb2", "TableWeb3", "BalloonText", "TableGrid", "TableTheme", "PlaceholderText", "NoSpacing", "LightShading", "LightList", "LightGrid", "MediumShading1", "MediumShading2", "MediumList1", "MediumList2", "MediumGrid1", "MediumGrid2", "MediumGrid3", "DarkList", "ColorfulShading", "ColorfulList", "ColorfulGrid", "LightShadingAccent1", "LightListAccent1", "LightGridAccent1", "MediumShading1Accent1", "MediumShading2Accent1", "MediumList1Accent1", "Revision", "ListParagraph", "Quote", "IntenseQuote", "MediumList2Accent1", "MediumGrid1Accent1", "MediumGrid2Accent1", "MediumGrid3Accent1", "DarkListAccent1", "ColorfulShadingAccent1", "ColorfulListAccent1", "ColorfulGridAccent1", "LightShadingAccent2", "LightListAccent2", "LightGridAccent2", "MediumShading1Accent2", "MediumShading2Accent2", "MediumList1Accent2", "MediumList2Accent2", "MediumGrid1Accent2", "MediumGrid2Accent2", "MediumGrid3Accent2", "DarkListAccent2", "ColorfulShadingAccent2", "ColorfulListAccent2", "ColorfulGridAccent2", "LightShadingAccent3", "LightListAccent3", "LightGridAccent3", "MediumShading1Accent3", "MediumShading2Accent3", "MediumList1Accent3", "MediumList2Accent3", "MediumGrid1Accent3", "MediumGrid2Accent3", "MediumGrid3Accent3", "DarkListAccent3", "ColorfulShadingAccent3", "ColorfulListAccent3", "ColorfulGridAccent3", "LightShadingAccent4", "LightListAccent4", "LightGridAccent4", "MediumShading1Accent4", "MediumShading2Accent4", "MediumList1Accent4", "MediumList2Accent4", "MediumGrid1Accent4", "MediumGrid2Accent4", "MediumGrid3Accent4", "DarkListAccent4", "ColorfulShadingAccent4", "ColorfulListAccent4", "ColorfulGridAccent4", "LightShadingAccent5", "LightListAccent5", "LightGridAccent5", "MediumShading1Accent5", "MediumShading2Accent5", "MediumList1Accent5", "MediumList2Accent5", "MediumGrid1Accent5", "MediumGrid2Accent5", "MediumGrid3Accent5", "DarkListAccent5", "ColorfulShadingAccent5", "ColorfulListAccent5", "ColorfulGridAccent5", "LightShadingAccent6", "LightListAccent6", "LightGridAccent6", "MediumShading1Accent6", "MediumShading2Accent6", "MediumList1Accent6", "MediumList2Accent6", "MediumGrid1Accent6", "MediumGrid2Accent6", "MediumGrid3Accent6", "DarkListAccent6", "ColorfulShadingAccent6", "ColorfulListAccent6", "ColorfulGridAccent6", "SubtleEmphasis", "IntenseEmphasis", "SubtleReference", "IntenseReference", "BookTitle", "Bibliography", "TocHeading", "PlainTable1", "PlainTable2", "PlainTable3", "PlainTable4", "PlainTable5", "TableGridLight", "GridTable1Light", "GridTable2", "GridTable3", "GridTable4", "GridTable5Dark", "GridTable6Colorful", "GridTable7Colorful", "GridTable1LightAccent1", "GridTable2Accent1", "GridTable3Accent1", "GridTable4Accent1", "GridTable5DarkAccent1", "GridTable6ColorfulAccent1", "GridTable7ColorfulAccent1", "GridTable1LightAccent2", "GridTable2Accent2", "GridTable3Accent2", "GridTable4Accent2", "GridTable5DarkAccent2", "GridTable6ColorfulAccent2", "GridTable7ColorfulAccent2", "GridTable1LightAccent3", "GridTable2Accent3", "GridTable3Accent3", "GridTable4Accent3", "GridTable5DarkAccent3", "GridTable6ColorfulAccent3", "GridTable7ColorfulAccent3", "GridTable1LightAccent4", "GridTable2Accent4", "GridTable3Accent4", "GridTable4Accent4", "GridTable5DarkAccent4", "GridTable6ColorfulAccent4", "GridTable7ColorfulAccent4", "GridTable1LightAccent5", "GridTable2Accent5", "GridTable3Accent5", "GridTable4Accent5", "GridTable5DarkAccent5", "GridTable6ColorfulAccent5", "GridTable7ColorfulAccent5", "GridTable1LightAccent6", "GridTable2Accent6", "GridTable3Accent6", "GridTable4Accent6", "GridTable5DarkAccent6", "GridTable6ColorfulAccent6", "GridTable7ColorfulAccent6", "ListTable1Light", "ListTable2", "ListTable3", "ListTable4", "ListTable5Dark", "ListTable6Colorful", "ListTable7Colorful", "ListTable1LightAccent1", "ListTable2Accent1", "ListTable3Accent1", "ListTable4Accent1", "ListTable5DarkAccent1", "ListTable6ColorfulAccent1", "ListTable7ColorfulAccent1", "ListTable1LightAccent2", "ListTable2Accent2", "ListTable3Accent2", "ListTable4Accent2", "ListTable5DarkAccent2", "ListTable6ColorfulAccent2", "ListTable7ColorfulAccent2", "ListTable1LightAccent3", "ListTable2Accent3", "ListTable3Accent3", "ListTable4Accent3", "ListTable5DarkAccent3", "ListTable6ColorfulAccent3", "ListTable7ColorfulAccent3", "ListTable1LightAccent4", "ListTable2Accent4", "ListTable3Accent4", "ListTable4Accent4", "ListTable5DarkAccent4", "ListTable6ColorfulAccent4", "ListTable7ColorfulAccent4", "ListTable1LightAccent5", "ListTable2Accent5", "ListTable3Accent5", "ListTable4Accent5", "ListTable5DarkAccent5", "ListTable6ColorfulAccent5", "ListTable7ColorfulAccent5", "ListTable1LightAccent6", "ListTable2Accent6", "ListTable3Accent6", "ListTable4Accent6", "ListTable5DarkAccent6", "ListTable6ColorfulAccent6", "ListTable7ColorfulAccent6", "SmartLink", "Mention", "SmartHyperlink", "Hashtag", "UnresolvedMention", "User", "Nil"])
      return false unless style_identifier_validator.valid?(@style_identifier)
      style_options_validator = EnumAttributeValidator.new('String', ["None", "FirstRow", "LastRow", "FirstColumn", "LastColumn", "RowBands", "Default", "ColumnBands", "Default2003"])
      return false unless style_options_validator.valid?(@style_options)
      text_wrapping_validator = EnumAttributeValidator.new('String', ["None", "Default", "Around"])
      return false unless text_wrapping_validator.valid?(@text_wrapping)

      return true
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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] style_options Object to be assigned
    def style_options=(style_options)
      validator = EnumAttributeValidator.new('String', ["None", "FirstRow", "LastRow", "FirstColumn", "LastColumn", "RowBands", "Default", "ColumnBands", "Default2003"])
      if style_options.to_i == 0
        unless validator.valid?(style_options)
          raise ArgumentError, "invalid value for 'style_options', must be one of #{validator.allowable_values}."
        end
        @style_options = style_options
      else
        @style_options = validator.allowable_values[style_options.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] text_wrapping Object to be assigned
    def text_wrapping=(text_wrapping)
      validator = EnumAttributeValidator.new('String', ["None", "Default", "Around"])
      if text_wrapping.to_i == 0
        unless validator.valid?(text_wrapping)
          raise ArgumentError, "invalid value for 'text_wrapping', must be one of #{validator.allowable_values}."
        end
        @text_wrapping = text_wrapping
      else
        @text_wrapping = validator.allowable_values[text_wrapping.to_i]
      end
    end


    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(other)
      return true if self.equal?(other)
      self.class == other.class &&
          link == other.link &&
          alignment == other.alignment &&
          allow_auto_fit == other.allow_auto_fit &&
          bidi == other.bidi &&
          bottom_padding == other.bottom_padding &&
          cell_spacing == other.cell_spacing &&
          left_indent == other.left_indent &&
          left_padding == other.left_padding &&
          preferred_width == other.preferred_width &&
          right_padding == other.right_padding &&
          style_identifier == other.style_identifier &&
          style_name == other.style_name &&
          style_options == other.style_options &&
          text_wrapping == other.text_wrapping &&
          top_padding == other.top_padding
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [link, alignment, allow_auto_fit, bidi, bottom_padding, cell_spacing, left_indent, left_padding, preferred_width, right_padding, style_identifier, style_name, style_options, text_wrapping, top_padding].hash
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
      unless self.preferred_width.nil?
          self.preferred_width.validate
      end

    end

  end
end
