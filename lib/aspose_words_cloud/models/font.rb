# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="font.rb">
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

  # DTO container with a font element.
  class Font
    # Gets or sets the link to the document.
    attr_accessor :link


    # Gets or sets a value indicating whether the font is formatted as all capital letters.
    attr_accessor :all_caps


    # Gets or sets a value indicating whether the contents of this run shall have right-to-left characteristics.
    # This property, when on, shall not be used with strongly left-to-right text. Any behavior under that condition is unspecified. This property, when off, shall not be used with strong right-to-left text. Any behavior under that condition is unspecified.When the contents of this run are displayed, all characters shall be treated as complex script characters for formatting purposes. This means that BoldBi, ItalicBi, SizeBi and a corresponding font name will be used when rendering this run.Also, when the contents of this run are displayed, this property acts as a right-to-left override for characters which are classified as "weak types" and "neutral types".
    attr_accessor :bidi


    # Gets or sets a value indicating whether the font is formatted as bold.
    attr_accessor :bold


    # Gets or sets a value indicating whether the right-to-left text is formatted as bold.
    attr_accessor :bold_bi


    # Gets or sets the border object, that specifies border for the font.
    attr_accessor :border


    # Gets or sets the color of the font.
    attr_accessor :color


    # Gets or sets a value indicating whether the contents of this run shall be treated as complex script text regardless of their Unicode character values when determining the formatting for this run.
    attr_accessor :complex_script


    # Gets or sets a value indicating whether the font is formatted as double strikethrough text.
    attr_accessor :double_strike_through


    # Gets or sets a value indicating whether the font is formatted as embossed.
    attr_accessor :emboss


    # Gets or sets a value indicating whether the font is formatted as engraved.
    attr_accessor :engrave


    # Gets or sets a value indicating whether the font is formatted as hidden text.
    attr_accessor :hidden


    # Gets or sets the highlight (marker) color.
    attr_accessor :highlight_color


    # Gets or sets a value indicating whether the font is formatted as italic.
    attr_accessor :italic


    # Gets or sets a value indicating whether the right-to-left text is formatted as italic.
    attr_accessor :italic_bi


    # Gets or sets the font size at which kerning starts.
    attr_accessor :kerning


    # Gets or sets the locale identifier (language) of the formatted characters.
    # For the list of locale identifiers see http://www.microsoft.com/globaldev/reference/lcid-all.mspx.
    attr_accessor :locale_id


    # Gets or sets the locale identifier (language) of the formatted right-to-left characters.
    # For the list of locale identifiers see http://www.microsoft.com/globaldev/reference/lcid-all.mspx.
    attr_accessor :locale_id_bi


    # Gets or sets the locale identifier (language) of the formatted Asian characters.
    # For the list of locale identifiers see http://www.microsoft.com/globaldev/reference/lcid-all.mspx.
    attr_accessor :locale_id_far_east


    # Gets or sets the name of the font.
    attr_accessor :name


    # Gets or sets the font used for Latin text (characters with character codes from 0 (zero) through 127).
    attr_accessor :name_ascii


    # Gets or sets the name of the font in a right-to-left language document.
    attr_accessor :name_bi


    # Gets or sets the East Asian font name.
    attr_accessor :name_far_east


    # Gets or sets the font used for characters with character codes from 128 through 255.
    attr_accessor :name_other


    # Gets or sets a value indicating whether the formatted characters are not to be spell checked.
    attr_accessor :no_proofing


    # Gets or sets a value indicating whether the font is formatted as outline.
    attr_accessor :outline


    # Gets or sets the position of text (in points) relative to the base line.
    # A positive number raises the text, and a negative number lowers it.
    attr_accessor :position


    # Gets or sets character width scaling in percent.
    attr_accessor :scaling


    # Gets or sets a value indicating whether the font is formatted as shadowed.
    attr_accessor :shadow


    # Gets or sets the font size in points.
    attr_accessor :size


    # Gets or sets the font size in points used in a right-to-left document.
    attr_accessor :size_bi


    # Gets or sets a value indicating whether the font is formatted as small capital letters.
    attr_accessor :small_caps


    # Gets or sets the spacing (in points) between characters.
    attr_accessor :spacing


    # Gets or sets a value indicating whether the font is formatted as strikethrough text.
    attr_accessor :strike_through


    # Gets or sets the locale independent style identifier of the character style applied to this formatting.
    attr_reader :style_identifier


    # Gets or sets the name of the character style applied to this formatting.
    attr_accessor :style_name


    # Gets or sets a value indicating whether the font is formatted as subscript.
    attr_accessor :subscript


    # Gets or sets a value indicating whether the font is formatted as superscript.
    attr_accessor :superscript


    # Gets or sets the font animation effect.
    attr_reader :text_effect


    # Gets or sets the type of underline applied to the font.
    attr_reader :underline


    # Gets or sets the color of the underline applied to the font.
    attr_accessor :underline_color


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
        :'all_caps' => :'AllCaps',
        :'bidi' => :'Bidi',
        :'bold' => :'Bold',
        :'bold_bi' => :'BoldBi',
        :'border' => :'Border',
        :'color' => :'Color',
        :'complex_script' => :'ComplexScript',
        :'double_strike_through' => :'DoubleStrikeThrough',
        :'emboss' => :'Emboss',
        :'engrave' => :'Engrave',
        :'hidden' => :'Hidden',
        :'highlight_color' => :'HighlightColor',
        :'italic' => :'Italic',
        :'italic_bi' => :'ItalicBi',
        :'kerning' => :'Kerning',
        :'locale_id' => :'LocaleId',
        :'locale_id_bi' => :'LocaleIdBi',
        :'locale_id_far_east' => :'LocaleIdFarEast',
        :'name' => :'Name',
        :'name_ascii' => :'NameAscii',
        :'name_bi' => :'NameBi',
        :'name_far_east' => :'NameFarEast',
        :'name_other' => :'NameOther',
        :'no_proofing' => :'NoProofing',
        :'outline' => :'Outline',
        :'position' => :'Position',
        :'scaling' => :'Scaling',
        :'shadow' => :'Shadow',
        :'size' => :'Size',
        :'size_bi' => :'SizeBi',
        :'small_caps' => :'SmallCaps',
        :'spacing' => :'Spacing',
        :'strike_through' => :'StrikeThrough',
        :'style_identifier' => :'StyleIdentifier',
        :'style_name' => :'StyleName',
        :'subscript' => :'Subscript',
        :'superscript' => :'Superscript',
        :'text_effect' => :'TextEffect',
        :'underline' => :'Underline',
        :'underline_color' => :'UnderlineColor'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'link' => :'WordsApiLink',
        :'all_caps' => :'BOOLEAN',
        :'bidi' => :'BOOLEAN',
        :'bold' => :'BOOLEAN',
        :'bold_bi' => :'BOOLEAN',
        :'border' => :'Border',
        :'color' => :'XmlColor',
        :'complex_script' => :'BOOLEAN',
        :'double_strike_through' => :'BOOLEAN',
        :'emboss' => :'BOOLEAN',
        :'engrave' => :'BOOLEAN',
        :'hidden' => :'BOOLEAN',
        :'highlight_color' => :'XmlColor',
        :'italic' => :'BOOLEAN',
        :'italic_bi' => :'BOOLEAN',
        :'kerning' => :'Float',
        :'locale_id' => :'Integer',
        :'locale_id_bi' => :'Integer',
        :'locale_id_far_east' => :'Integer',
        :'name' => :'String',
        :'name_ascii' => :'String',
        :'name_bi' => :'String',
        :'name_far_east' => :'String',
        :'name_other' => :'String',
        :'no_proofing' => :'BOOLEAN',
        :'outline' => :'BOOLEAN',
        :'position' => :'Float',
        :'scaling' => :'Integer',
        :'shadow' => :'BOOLEAN',
        :'size' => :'Float',
        :'size_bi' => :'Float',
        :'small_caps' => :'BOOLEAN',
        :'spacing' => :'Float',
        :'strike_through' => :'BOOLEAN',
        :'style_identifier' => :'String',
        :'style_name' => :'String',
        :'subscript' => :'BOOLEAN',
        :'superscript' => :'BOOLEAN',
        :'text_effect' => :'String',
        :'underline' => :'String',
        :'underline_color' => :'XmlColor'
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

      if attributes.key?(:'AllCaps')
        self.all_caps = attributes[:'AllCaps']
      end

      if attributes.key?(:'Bidi')
        self.bidi = attributes[:'Bidi']
      end

      if attributes.key?(:'Bold')
        self.bold = attributes[:'Bold']
      end

      if attributes.key?(:'BoldBi')
        self.bold_bi = attributes[:'BoldBi']
      end

      if attributes.key?(:'Border')
        self.border = attributes[:'Border']
      end

      if attributes.key?(:'Color')
        self.color = attributes[:'Color']
      end

      if attributes.key?(:'ComplexScript')
        self.complex_script = attributes[:'ComplexScript']
      end

      if attributes.key?(:'DoubleStrikeThrough')
        self.double_strike_through = attributes[:'DoubleStrikeThrough']
      end

      if attributes.key?(:'Emboss')
        self.emboss = attributes[:'Emboss']
      end

      if attributes.key?(:'Engrave')
        self.engrave = attributes[:'Engrave']
      end

      if attributes.key?(:'Hidden')
        self.hidden = attributes[:'Hidden']
      end

      if attributes.key?(:'HighlightColor')
        self.highlight_color = attributes[:'HighlightColor']
      end

      if attributes.key?(:'Italic')
        self.italic = attributes[:'Italic']
      end

      if attributes.key?(:'ItalicBi')
        self.italic_bi = attributes[:'ItalicBi']
      end

      if attributes.key?(:'Kerning')
        self.kerning = attributes[:'Kerning']
      end

      if attributes.key?(:'LocaleId')
        self.locale_id = attributes[:'LocaleId']
      end

      if attributes.key?(:'LocaleIdBi')
        self.locale_id_bi = attributes[:'LocaleIdBi']
      end

      if attributes.key?(:'LocaleIdFarEast')
        self.locale_id_far_east = attributes[:'LocaleIdFarEast']
      end

      if attributes.key?(:'Name')
        self.name = attributes[:'Name']
      end

      if attributes.key?(:'NameAscii')
        self.name_ascii = attributes[:'NameAscii']
      end

      if attributes.key?(:'NameBi')
        self.name_bi = attributes[:'NameBi']
      end

      if attributes.key?(:'NameFarEast')
        self.name_far_east = attributes[:'NameFarEast']
      end

      if attributes.key?(:'NameOther')
        self.name_other = attributes[:'NameOther']
      end

      if attributes.key?(:'NoProofing')
        self.no_proofing = attributes[:'NoProofing']
      end

      if attributes.key?(:'Outline')
        self.outline = attributes[:'Outline']
      end

      if attributes.key?(:'Position')
        self.position = attributes[:'Position']
      end

      if attributes.key?(:'Scaling')
        self.scaling = attributes[:'Scaling']
      end

      if attributes.key?(:'Shadow')
        self.shadow = attributes[:'Shadow']
      end

      if attributes.key?(:'Size')
        self.size = attributes[:'Size']
      end

      if attributes.key?(:'SizeBi')
        self.size_bi = attributes[:'SizeBi']
      end

      if attributes.key?(:'SmallCaps')
        self.small_caps = attributes[:'SmallCaps']
      end

      if attributes.key?(:'Spacing')
        self.spacing = attributes[:'Spacing']
      end

      if attributes.key?(:'StrikeThrough')
        self.strike_through = attributes[:'StrikeThrough']
      end

      if attributes.key?(:'StyleIdentifier')
        self.style_identifier = attributes[:'StyleIdentifier']
      end

      if attributes.key?(:'StyleName')
        self.style_name = attributes[:'StyleName']
      end

      if attributes.key?(:'Subscript')
        self.subscript = attributes[:'Subscript']
      end

      if attributes.key?(:'Superscript')
        self.superscript = attributes[:'Superscript']
      end

      if attributes.key?(:'TextEffect')
        self.text_effect = attributes[:'TextEffect']
      end

      if attributes.key?(:'Underline')
        self.underline = attributes[:'Underline']
      end

      if attributes.key?(:'UnderlineColor')
        self.underline_color = attributes[:'UnderlineColor']
      end
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      style_identifier_validator = EnumAttributeValidator.new('String', ["Normal", "Heading1", "Heading2", "Heading3", "Heading4", "Heading5", "Heading6", "Heading7", "Heading8", "Heading9", "Index1", "Index2", "Index3", "Index4", "Index5", "Index6", "Index7", "Index8", "Index9", "Toc1", "Toc2", "Toc3", "Toc4", "Toc5", "Toc6", "Toc7", "Toc8", "Toc9", "NormalIndent", "FootnoteText", "CommentText", "Header", "Footer", "IndexHeading", "Caption", "TableOfFigures", "EnvelopeAddress", "EnvelopeReturn", "FootnoteReference", "CommentReference", "LineNumber", "PageNumber", "EndnoteReference", "EndnoteText", "TableOfAuthorities", "Macro", "ToaHeading", "List", "ListBullet", "ListNumber", "List2", "List3", "List4", "List5", "ListBullet2", "ListBullet3", "ListBullet4", "ListBullet5", "ListNumber2", "ListNumber3", "ListNumber4", "ListNumber5", "Title", "Closing", "Signature", "DefaultParagraphFont", "BodyText", "BodyTextInd", "ListContinue", "ListContinue2", "ListContinue3", "ListContinue4", "ListContinue5", "MessageHeader", "Subtitle", "Salutation", "Date", "BodyText1I", "BodyText1I2", "NoteHeading", "BodyText2", "BodyText3", "BodyTextInd2", "BodyTextInd3", "BlockText", "Hyperlink", "FollowedHyperlink", "Strong", "Emphasis", "DocumentMap", "PlainText", "EmailSignature", "HtmlTopOfForm", "HtmlBottomOfForm", "NormalWeb", "HtmlAcronym", "HtmlAddress", "HtmlCite", "HtmlCode", "HtmlDefinition", "HtmlKeyboard", "HtmlPreformatted", "HtmlSample", "HtmlTypewriter", "HtmlVariable", "TableNormal", "CommentSubject", "NoList", "OutlineList1", "OutlineList2", "OutlineList3", "TableSimple1", "TableSimple2", "TableSimple3", "TableClassic1", "TableClassic2", "TableClassic3", "TableClassic4", "TableColorful1", "TableColorful2", "TableColorful3", "TableColumns1", "TableColumns2", "TableColumns3", "TableColumns4", "TableColumns5", "TableGrid1", "TableGrid2", "TableGrid3", "TableGrid4", "TableGrid5", "TableGrid6", "TableGrid7", "TableGrid8", "TableList1", "TableList2", "TableList3", "TableList4", "TableList5", "TableList6", "TableList7", "TableList8", "Table3DEffects1", "Table3DEffects2", "Table3DEffects3", "TableContemporary", "TableElegant", "TableProfessional", "TableSubtle1", "TableSubtle2", "TableWeb1", "TableWeb2", "TableWeb3", "BalloonText", "TableGrid", "TableTheme", "PlaceholderText", "NoSpacing", "LightShading", "LightList", "LightGrid", "MediumShading1", "MediumShading2", "MediumList1", "MediumList2", "MediumGrid1", "MediumGrid2", "MediumGrid3", "DarkList", "ColorfulShading", "ColorfulList", "ColorfulGrid", "LightShadingAccent1", "LightListAccent1", "LightGridAccent1", "MediumShading1Accent1", "MediumShading2Accent1", "MediumList1Accent1", "Revision", "ListParagraph", "Quote", "IntenseQuote", "MediumList2Accent1", "MediumGrid1Accent1", "MediumGrid2Accent1", "MediumGrid3Accent1", "DarkListAccent1", "ColorfulShadingAccent1", "ColorfulListAccent1", "ColorfulGridAccent1", "LightShadingAccent2", "LightListAccent2", "LightGridAccent2", "MediumShading1Accent2", "MediumShading2Accent2", "MediumList1Accent2", "MediumList2Accent2", "MediumGrid1Accent2", "MediumGrid2Accent2", "MediumGrid3Accent2", "DarkListAccent2", "ColorfulShadingAccent2", "ColorfulListAccent2", "ColorfulGridAccent2", "LightShadingAccent3", "LightListAccent3", "LightGridAccent3", "MediumShading1Accent3", "MediumShading2Accent3", "MediumList1Accent3", "MediumList2Accent3", "MediumGrid1Accent3", "MediumGrid2Accent3", "MediumGrid3Accent3", "DarkListAccent3", "ColorfulShadingAccent3", "ColorfulListAccent3", "ColorfulGridAccent3", "LightShadingAccent4", "LightListAccent4", "LightGridAccent4", "MediumShading1Accent4", "MediumShading2Accent4", "MediumList1Accent4", "MediumList2Accent4", "MediumGrid1Accent4", "MediumGrid2Accent4", "MediumGrid3Accent4", "DarkListAccent4", "ColorfulShadingAccent4", "ColorfulListAccent4", "ColorfulGridAccent4", "LightShadingAccent5", "LightListAccent5", "LightGridAccent5", "MediumShading1Accent5", "MediumShading2Accent5", "MediumList1Accent5", "MediumList2Accent5", "MediumGrid1Accent5", "MediumGrid2Accent5", "MediumGrid3Accent5", "DarkListAccent5", "ColorfulShadingAccent5", "ColorfulListAccent5", "ColorfulGridAccent5", "LightShadingAccent6", "LightListAccent6", "LightGridAccent6", "MediumShading1Accent6", "MediumShading2Accent6", "MediumList1Accent6", "MediumList2Accent6", "MediumGrid1Accent6", "MediumGrid2Accent6", "MediumGrid3Accent6", "DarkListAccent6", "ColorfulShadingAccent6", "ColorfulListAccent6", "ColorfulGridAccent6", "SubtleEmphasis", "IntenseEmphasis", "SubtleReference", "IntenseReference", "BookTitle", "Bibliography", "TocHeading", "PlainTable1", "PlainTable2", "PlainTable3", "PlainTable4", "PlainTable5", "TableGridLight", "GridTable1Light", "GridTable2", "GridTable3", "GridTable4", "GridTable5Dark", "GridTable6Colorful", "GridTable7Colorful", "GridTable1LightAccent1", "GridTable2Accent1", "GridTable3Accent1", "GridTable4Accent1", "GridTable5DarkAccent1", "GridTable6ColorfulAccent1", "GridTable7ColorfulAccent1", "GridTable1LightAccent2", "GridTable2Accent2", "GridTable3Accent2", "GridTable4Accent2", "GridTable5DarkAccent2", "GridTable6ColorfulAccent2", "GridTable7ColorfulAccent2", "GridTable1LightAccent3", "GridTable2Accent3", "GridTable3Accent3", "GridTable4Accent3", "GridTable5DarkAccent3", "GridTable6ColorfulAccent3", "GridTable7ColorfulAccent3", "GridTable1LightAccent4", "GridTable2Accent4", "GridTable3Accent4", "GridTable4Accent4", "GridTable5DarkAccent4", "GridTable6ColorfulAccent4", "GridTable7ColorfulAccent4", "GridTable1LightAccent5", "GridTable2Accent5", "GridTable3Accent5", "GridTable4Accent5", "GridTable5DarkAccent5", "GridTable6ColorfulAccent5", "GridTable7ColorfulAccent5", "GridTable1LightAccent6", "GridTable2Accent6", "GridTable3Accent6", "GridTable4Accent6", "GridTable5DarkAccent6", "GridTable6ColorfulAccent6", "GridTable7ColorfulAccent6", "ListTable1Light", "ListTable2", "ListTable3", "ListTable4", "ListTable5Dark", "ListTable6Colorful", "ListTable7Colorful", "ListTable1LightAccent1", "ListTable2Accent1", "ListTable3Accent1", "ListTable4Accent1", "ListTable5DarkAccent1", "ListTable6ColorfulAccent1", "ListTable7ColorfulAccent1", "ListTable1LightAccent2", "ListTable2Accent2", "ListTable3Accent2", "ListTable4Accent2", "ListTable5DarkAccent2", "ListTable6ColorfulAccent2", "ListTable7ColorfulAccent2", "ListTable1LightAccent3", "ListTable2Accent3", "ListTable3Accent3", "ListTable4Accent3", "ListTable5DarkAccent3", "ListTable6ColorfulAccent3", "ListTable7ColorfulAccent3", "ListTable1LightAccent4", "ListTable2Accent4", "ListTable3Accent4", "ListTable4Accent4", "ListTable5DarkAccent4", "ListTable6ColorfulAccent4", "ListTable7ColorfulAccent4", "ListTable1LightAccent5", "ListTable2Accent5", "ListTable3Accent5", "ListTable4Accent5", "ListTable5DarkAccent5", "ListTable6ColorfulAccent5", "ListTable7ColorfulAccent5", "ListTable1LightAccent6", "ListTable2Accent6", "ListTable3Accent6", "ListTable4Accent6", "ListTable5DarkAccent6", "ListTable6ColorfulAccent6", "ListTable7ColorfulAccent6", "SmartLink", "Mention", "SmartHyperlink", "Hashtag", "UnresolvedMention", "User", "Nil"])
      return false unless style_identifier_validator.valid?(@style_identifier)
      text_effect_validator = EnumAttributeValidator.new('String', ["None", "LasVegasLights", "BlinkingBackground", "SparkleText", "MarchingBlackAnts", "MarchingRedAnts", "Shimmer"])
      return false unless text_effect_validator.valid?(@text_effect)
      underline_validator = EnumAttributeValidator.new('String', ["None", "Single", "Words", "Double", "Dotted", "Thick", "Dash", "DotDash", "DotDotDash", "Wavy", "DottedHeavy", "DashHeavy", "DotDashHeavy", "DotDotDashHeavy", "WavyHeavy", "DashLong", "WavyDouble", "DashLongHeavy"])
      return false unless underline_validator.valid?(@underline)

      return true
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
    # @param [Object] text_effect Object to be assigned
    def text_effect=(text_effect)
      validator = EnumAttributeValidator.new('String', ["None", "LasVegasLights", "BlinkingBackground", "SparkleText", "MarchingBlackAnts", "MarchingRedAnts", "Shimmer"])
      if text_effect.to_i == 0
        unless validator.valid?(text_effect)
          raise ArgumentError, "invalid value for 'text_effect', must be one of #{validator.allowable_values}."
        end
        @text_effect = text_effect
      else
        @text_effect = validator.allowable_values[text_effect.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] underline Object to be assigned
    def underline=(underline)
      validator = EnumAttributeValidator.new('String', ["None", "Single", "Words", "Double", "Dotted", "Thick", "Dash", "DotDash", "DotDotDash", "Wavy", "DottedHeavy", "DashHeavy", "DotDashHeavy", "DotDotDashHeavy", "WavyHeavy", "DashLong", "WavyDouble", "DashLongHeavy"])
      if underline.to_i == 0
        unless validator.valid?(underline)
          raise ArgumentError, "invalid value for 'underline', must be one of #{validator.allowable_values}."
        end
        @underline = underline
      else
        @underline = validator.allowable_values[underline.to_i]
      end
    end


    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(other)
      return true if self.equal?(other)
      self.class == other.class &&
          link == other.link &&
          all_caps == other.all_caps &&
          bidi == other.bidi &&
          bold == other.bold &&
          bold_bi == other.bold_bi &&
          border == other.border &&
          color == other.color &&
          complex_script == other.complex_script &&
          double_strike_through == other.double_strike_through &&
          emboss == other.emboss &&
          engrave == other.engrave &&
          hidden == other.hidden &&
          highlight_color == other.highlight_color &&
          italic == other.italic &&
          italic_bi == other.italic_bi &&
          kerning == other.kerning &&
          locale_id == other.locale_id &&
          locale_id_bi == other.locale_id_bi &&
          locale_id_far_east == other.locale_id_far_east &&
          name == other.name &&
          name_ascii == other.name_ascii &&
          name_bi == other.name_bi &&
          name_far_east == other.name_far_east &&
          name_other == other.name_other &&
          no_proofing == other.no_proofing &&
          outline == other.outline &&
          position == other.position &&
          scaling == other.scaling &&
          shadow == other.shadow &&
          size == other.size &&
          size_bi == other.size_bi &&
          small_caps == other.small_caps &&
          spacing == other.spacing &&
          strike_through == other.strike_through &&
          style_identifier == other.style_identifier &&
          style_name == other.style_name &&
          subscript == other.subscript &&
          superscript == other.superscript &&
          text_effect == other.text_effect &&
          underline == other.underline &&
          underline_color == other.underline_color
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [link, all_caps, bidi, bold, bold_bi, border, color, complex_script, double_strike_through, emboss, engrave, hidden, highlight_color, italic, italic_bi, kerning, locale_id, locale_id_bi, locale_id_far_east, name, name_ascii, name_bi, name_far_east, name_other, no_proofing, outline, position, scaling, shadow, size, size_bi, small_caps, spacing, strike_through, style_identifier, style_name, subscript, superscript, text_effect, underline, underline_color].hash
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
      unless self.border.nil?
          self.border.validate
      end
      unless self.color.nil?
          self.color.validate
      end
      unless self.highlight_color.nil?
          self.highlight_color.validate
      end
      unless self.underline_color.nil?
          self.underline_color.validate
      end

    end

  end
end
