# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="pdf_save_options_data.rb">
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

  # Container class for pdf save options.
  class PdfSaveOptionsData
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

    # Gets or sets a value determining how attachments are embedded to the PDF document.
    # The default value is None and attachments are not embedded.
    # PDF/A-1, PDF/A-2 and regular PDF/A-4 (not PDF/A-4f) standards do not allow embedded files.
    # None value will be used automatically.
    attr_accessor :attachments_embedding_mode

    # Gets or sets a value determining whether or not to cache graphics placed in document's background.
    # The default value is true and background graphics are written to the PDF document as an xObject. When the value is false background graphics are not cached. Some shapes are not supported for caching(shapes with fields, bookmarks, HRefs). Document background graphic is various shapes, charts, images placed in the footer or header,
    # well as background and border of a page.
    attr_accessor :cache_background_graphics

    # Gets or sets the PDF standards compliance level for output documents.
    attr_accessor :compliance

    # Gets or sets a value indicating whether to convert footnote/endnote references in main text story into active hyperlinks.
    # When clicked the hyperlink will lead to the corresponding footnote/endnote.
    # The default value is false.
    attr_accessor :create_note_hyperlinks

    # Gets or sets the option that controls the way CustomDocumentProperties are exported to PDF file.
    # The default value is None.
    attr_accessor :custom_properties_export

    # Gets or sets the details for signing the output PDF document.
    attr_accessor :digital_signature_details

    # Gets or sets a value indicating whether the window’s title bar should display the document title taken from the Title entry of the document information dictionary.
    # If false, the title bar should instead display the name of the PDF file containing the document.
    # The default value is false.
    attr_accessor :display_doc_title

    # Gets or sets the downsample options.
    attr_accessor :downsample_options

    # Gets or sets a value determining whether or not to embed attachments to the PDF document.
    # The default value is false and attachments are not embedded.
    # When the value is true attachments are embedded to the PDF document.
    # Embedding attachments is not supported when saving to PDF/A and PDF/UA compliance.
    # false value will be used automatically.
    # Embedding attachments is not supported when encryption is enabled. false value will be used automatically.
    attr_accessor :embed_attachments

    # Gets or sets a value indicating whether fonts are embedded into the resulting PDF documents.
    attr_accessor :embed_full_fonts

    # Gets or sets the details for encrypting the output PDF document.
    attr_accessor :encryption_details

    # Gets or sets a value indicating whether to export document structure.
    attr_accessor :export_document_structure

    # Gets or sets a value determining whether or not to create a "Span" tag in the document structure to export the text language.
    # The default value is false and "Lang" attribute is attached to a marked-content sequence in a page content stream.
    # When the value is true "Span" tag is created for the text with non-default language and "Lang" attribute is attached to this tag.
    # This value is ignored when Aspose.Words.Saving.PdfSaveOptions.ExportDocumentStructure is false.
    attr_accessor :export_language_to_span_tag

    # Gets or sets the font embedding mode.
    attr_accessor :font_embedding_mode

    # Gets or sets a value determining  whether to generate scripts that emulate specific Microsoft Word form field behavior in PDF.
    # Default is false.
    # When this option is enabled, the exporter generates PDF JavaScript actions to emulate Microsoft Word
    # form field behavior, such as date and time form fields with formatting and validation rules.When set to true, supported behavior will be exported as PDF JavaScript actions.
    # When set to false, no form field scripts will be generated.Script execution depends on the PDF viewer. Some PDF viewers might ignore scripts, restrict script execution,
    # or require the user to enable JavaScript.JavaScript actions are prohibited by PDF/A-1, PDF/A-2 and PDF/A-3 compliance.
    # The false value will be used automatically in this case.
    attr_accessor :generate_form_field_scripts

    # Gets or sets the option that controls how bookmarks in headers/footers are exported.
    # The default value is Aspose.Words.Saving.HeaderFooterBookmarksExportMode.All.
    attr_accessor :header_footer_bookmarks_export_mode

    # Gets or sets the option that controls how the color space will be selected for the images in PDF document.
    # The default value is "Auto". If "SimpleCmyk" value is specified, ImageCompression option is ignored and Flate compression is used for all images in the document.
    attr_accessor :image_color_space_export_mode

    # Gets or sets the compression type to be used for all images in the document.
    attr_accessor :image_compression

    # Gets or sets a value indicating whether image interpolation shall be performed by a conforming reader. When false is specified, the flag is not written to the output document and the default behavior of reader is used instead.
    # When the resolution of a source image is significantly lower than that of the output device, each source sample covers many device pixels. As a result, images can appear jaggy or blocky. These visual artifacts can be reduced by applying an image interpolation algorithm during rendering. Instead of painting all pixels covered by a source sample with the same color, image interpolation attempts to produce a smooth transition between adjacent sample values. A conforming Reader may choose to not implement this feature of PDF, or may use any specific implementation of interpolation that it wishes. The default value is false.
    attr_accessor :interpolate_images

    # Gets or sets a value indicating whether hyperlinks in the output Pdf document are forced to be opened in a new window (or tab) of a browser.
    attr_accessor :open_hyperlinks_in_new_window

    # Gets or sets the outline options.
    attr_accessor :outline_options

    # Gets or sets the option that controls how the PDF document should be displayed when opened in the PDF reader.
    attr_accessor :page_mode

    # Gets or sets a value indicating whether to preblend transparent images with black background color.
    # Preblending images may improve PDF document visual appearance in Adobe Reader and remove anti-aliasing artifacts.In order to properly display preblended images, PDF viewer application must support /Matte entry in soft-mask image dictionary.
    # Also preblending images may decrease PDF rendering performance.The default value is false.
    attr_accessor :preblend_images

    # Gets or sets a value indicating whether to preserve Microsoft Word form fields as form fields in PDF or convert them to text.
    attr_accessor :preserve_form_fields

    # Gets or sets a value indicating whether to render PDF choice form field border.
    # PDF choice form fields are used for export of SDT Combo Box Content Control, SDT Drop-Down List Content
    # Control and legacy Drop-Down Form Field when PreserveFormFields option is enabled.The default value is true.
    attr_accessor :render_choice_form_field_border

    # Gets or sets the compression type to be used for all textual content in the document.
    attr_accessor :text_compression

    # Gets or sets a value indicating whether the document should be saved using a booklet printing layout.
    attr_accessor :use_book_fold_printing_settings

    # Gets or sets a value indicating whether to substitute TrueType fonts Arial, Times New Roman, Courier New and Symbol with core PDF Type 1 fonts.
    attr_accessor :use_core_fonts

    # Gets or sets a value indicating whether to use SDT control Tag or Id property as a name of form field in PDF.
    # The default value is false.When set to false, SDT control Id property is used as a name of form field in PDF.When set to true, SDT control Tag property is used as a name of form field in PDF.If set to true and Tag is empty, Id property will be used as a form field name.If set to true and Tag values are not unique, duplicate Tag values will be altered to build
    # unique PDF form field names.
    attr_accessor :use_sdt_tag_as_form_field_name

    # Gets or sets the option that controls what type of zoom should be applied when a document is opened with a PDF viewer.
    attr_accessor :zoom_behavior

    # Gets or sets the zoom factor (in percentages) for a document.
    attr_accessor :zoom_factor

    # Gets or sets a value determining whether floating shapes are exported as inline tags in the document structure.
    # The default value is false and floating shapes will be exported as block-level tags,
    # placed after the paragraph in which they are anchored. When the value is true floating shapes will be exported as inline tags,
    # placed within the paragraph where they are anchored. This value is ignored when ExportDocumentStructure is false.
    attr_accessor :export_floating_shapes_as_inline_tag

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
        :'attachments_embedding_mode' => :'AttachmentsEmbeddingMode',
        :'cache_background_graphics' => :'CacheBackgroundGraphics',
        :'compliance' => :'Compliance',
        :'create_note_hyperlinks' => :'CreateNoteHyperlinks',
        :'custom_properties_export' => :'CustomPropertiesExport',
        :'digital_signature_details' => :'DigitalSignatureDetails',
        :'display_doc_title' => :'DisplayDocTitle',
        :'downsample_options' => :'DownsampleOptions',
        :'embed_attachments' => :'EmbedAttachments',
        :'embed_full_fonts' => :'EmbedFullFonts',
        :'encryption_details' => :'EncryptionDetails',
        :'export_document_structure' => :'ExportDocumentStructure',
        :'export_language_to_span_tag' => :'ExportLanguageToSpanTag',
        :'font_embedding_mode' => :'FontEmbeddingMode',
        :'generate_form_field_scripts' => :'GenerateFormFieldScripts',
        :'header_footer_bookmarks_export_mode' => :'HeaderFooterBookmarksExportMode',
        :'image_color_space_export_mode' => :'ImageColorSpaceExportMode',
        :'image_compression' => :'ImageCompression',
        :'interpolate_images' => :'InterpolateImages',
        :'open_hyperlinks_in_new_window' => :'OpenHyperlinksInNewWindow',
        :'outline_options' => :'OutlineOptions',
        :'page_mode' => :'PageMode',
        :'preblend_images' => :'PreblendImages',
        :'preserve_form_fields' => :'PreserveFormFields',
        :'render_choice_form_field_border' => :'RenderChoiceFormFieldBorder',
        :'text_compression' => :'TextCompression',
        :'use_book_fold_printing_settings' => :'UseBookFoldPrintingSettings',
        :'use_core_fonts' => :'UseCoreFonts',
        :'use_sdt_tag_as_form_field_name' => :'UseSdtTagAsFormFieldName',
        :'zoom_behavior' => :'ZoomBehavior',
        :'zoom_factor' => :'ZoomFactor',
        :'export_floating_shapes_as_inline_tag' => :'ExportFloatingShapesAsInlineTag',
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
        :'attachments_embedding_mode' => :'String',
        :'cache_background_graphics' => :'BOOLEAN',
        :'compliance' => :'String',
        :'create_note_hyperlinks' => :'BOOLEAN',
        :'custom_properties_export' => :'String',
        :'digital_signature_details' => :'PdfDigitalSignatureDetailsData',
        :'display_doc_title' => :'BOOLEAN',
        :'downsample_options' => :'DownsampleOptionsData',
        :'embed_attachments' => :'BOOLEAN',
        :'embed_full_fonts' => :'BOOLEAN',
        :'encryption_details' => :'PdfEncryptionDetailsData',
        :'export_document_structure' => :'BOOLEAN',
        :'export_language_to_span_tag' => :'BOOLEAN',
        :'font_embedding_mode' => :'String',
        :'generate_form_field_scripts' => :'BOOLEAN',
        :'header_footer_bookmarks_export_mode' => :'String',
        :'image_color_space_export_mode' => :'String',
        :'image_compression' => :'String',
        :'interpolate_images' => :'BOOLEAN',
        :'open_hyperlinks_in_new_window' => :'BOOLEAN',
        :'outline_options' => :'OutlineOptionsData',
        :'page_mode' => :'String',
        :'preblend_images' => :'BOOLEAN',
        :'preserve_form_fields' => :'BOOLEAN',
        :'render_choice_form_field_border' => :'BOOLEAN',
        :'text_compression' => :'String',
        :'use_book_fold_printing_settings' => :'BOOLEAN',
        :'use_core_fonts' => :'BOOLEAN',
        :'use_sdt_tag_as_form_field_name' => :'BOOLEAN',
        :'zoom_behavior' => :'String',
        :'zoom_factor' => :'Integer',
        :'export_floating_shapes_as_inline_tag' => :'BOOLEAN',
        :'save_format' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.save_format = 'pdf'

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

      if attributes.key?(:'AttachmentsEmbeddingMode')
        self.attachments_embedding_mode = attributes[:'AttachmentsEmbeddingMode']
      end

      if attributes.key?(:'CacheBackgroundGraphics')
        self.cache_background_graphics = attributes[:'CacheBackgroundGraphics']
      end

      if attributes.key?(:'Compliance')
        self.compliance = attributes[:'Compliance']
      end

      if attributes.key?(:'CreateNoteHyperlinks')
        self.create_note_hyperlinks = attributes[:'CreateNoteHyperlinks']
      end

      if attributes.key?(:'CustomPropertiesExport')
        self.custom_properties_export = attributes[:'CustomPropertiesExport']
      end

      if attributes.key?(:'DigitalSignatureDetails')
        self.digital_signature_details = attributes[:'DigitalSignatureDetails']
      end

      if attributes.key?(:'DisplayDocTitle')
        self.display_doc_title = attributes[:'DisplayDocTitle']
      end

      if attributes.key?(:'DownsampleOptions')
        self.downsample_options = attributes[:'DownsampleOptions']
      end

      if attributes.key?(:'EmbedAttachments')
        self.embed_attachments = attributes[:'EmbedAttachments']
      end

      if attributes.key?(:'EmbedFullFonts')
        self.embed_full_fonts = attributes[:'EmbedFullFonts']
      end

      if attributes.key?(:'EncryptionDetails')
        self.encryption_details = attributes[:'EncryptionDetails']
      end

      if attributes.key?(:'ExportDocumentStructure')
        self.export_document_structure = attributes[:'ExportDocumentStructure']
      end

      if attributes.key?(:'ExportLanguageToSpanTag')
        self.export_language_to_span_tag = attributes[:'ExportLanguageToSpanTag']
      end

      if attributes.key?(:'FontEmbeddingMode')
        self.font_embedding_mode = attributes[:'FontEmbeddingMode']
      end

      if attributes.key?(:'GenerateFormFieldScripts')
        self.generate_form_field_scripts = attributes[:'GenerateFormFieldScripts']
      end

      if attributes.key?(:'HeaderFooterBookmarksExportMode')
        self.header_footer_bookmarks_export_mode = attributes[:'HeaderFooterBookmarksExportMode']
      end

      if attributes.key?(:'ImageColorSpaceExportMode')
        self.image_color_space_export_mode = attributes[:'ImageColorSpaceExportMode']
      end

      if attributes.key?(:'ImageCompression')
        self.image_compression = attributes[:'ImageCompression']
      end

      if attributes.key?(:'InterpolateImages')
        self.interpolate_images = attributes[:'InterpolateImages']
      end

      if attributes.key?(:'OpenHyperlinksInNewWindow')
        self.open_hyperlinks_in_new_window = attributes[:'OpenHyperlinksInNewWindow']
      end

      if attributes.key?(:'OutlineOptions')
        self.outline_options = attributes[:'OutlineOptions']
      end

      if attributes.key?(:'PageMode')
        self.page_mode = attributes[:'PageMode']
      end

      if attributes.key?(:'PreblendImages')
        self.preblend_images = attributes[:'PreblendImages']
      end

      if attributes.key?(:'PreserveFormFields')
        self.preserve_form_fields = attributes[:'PreserveFormFields']
      end

      if attributes.key?(:'RenderChoiceFormFieldBorder')
        self.render_choice_form_field_border = attributes[:'RenderChoiceFormFieldBorder']
      end

      if attributes.key?(:'TextCompression')
        self.text_compression = attributes[:'TextCompression']
      end

      if attributes.key?(:'UseBookFoldPrintingSettings')
        self.use_book_fold_printing_settings = attributes[:'UseBookFoldPrintingSettings']
      end

      if attributes.key?(:'UseCoreFonts')
        self.use_core_fonts = attributes[:'UseCoreFonts']
      end

      if attributes.key?(:'UseSdtTagAsFormFieldName')
        self.use_sdt_tag_as_form_field_name = attributes[:'UseSdtTagAsFormFieldName']
      end

      if attributes.key?(:'ZoomBehavior')
        self.zoom_behavior = attributes[:'ZoomBehavior']
      end

      if attributes.key?(:'ZoomFactor')
        self.zoom_factor = attributes[:'ZoomFactor']
      end

      if attributes.key?(:'ExportFloatingShapesAsInlineTag')
        self.export_floating_shapes_as_inline_tag = attributes[:'ExportFloatingShapesAsInlineTag']
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
      attachments_embedding_mode_validator = EnumAttributeValidator.new('String', ["None", "Annotations", "DocumentEmbeddedFiles"])
      return false unless attachments_embedding_mode_validator.valid?(@attachments_embedding_mode)
      compliance_validator = EnumAttributeValidator.new('String', ["Pdf17", "Pdf20", "PdfA1a", "PdfA1b", "PdfA2a", "PdfA2u", "PdfA3a", "PdfA3u", "PdfA4", "PdfA4f", "PdfA4Ua2", "PdfUa1", "PdfUa2"])
      return false unless compliance_validator.valid?(@compliance)
      custom_properties_export_validator = EnumAttributeValidator.new('String', ["None", "Standard", "Metadata"])
      return false unless custom_properties_export_validator.valid?(@custom_properties_export)
      font_embedding_mode_validator = EnumAttributeValidator.new('String', ["EmbedAll", "EmbedNonstandard", "EmbedNone"])
      return false unless font_embedding_mode_validator.valid?(@font_embedding_mode)
      header_footer_bookmarks_export_mode_validator = EnumAttributeValidator.new('String', ["None", "First", "All"])
      return false unless header_footer_bookmarks_export_mode_validator.valid?(@header_footer_bookmarks_export_mode)
      image_color_space_export_mode_validator = EnumAttributeValidator.new('String', ["Auto", "SimpleCmyk"])
      return false unless image_color_space_export_mode_validator.valid?(@image_color_space_export_mode)
      page_mode_validator = EnumAttributeValidator.new('String', ["UseNone", "UseOutlines", "UseThumbs", "FullScreen", "UseOC", "UseAttachments"])
      return false unless page_mode_validator.valid?(@page_mode)
      text_compression_validator = EnumAttributeValidator.new('String', ["None", "Flate"])
      return false unless text_compression_validator.valid?(@text_compression)
      zoom_behavior_validator = EnumAttributeValidator.new('String', ["None", "ZoomFactor", "FitPage", "FitWidth", "FitHeight", "FitBox"])
      return false unless zoom_behavior_validator.valid?(@zoom_behavior)

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
    # @param [Object] attachments_embedding_mode Object to be assigned
    def attachments_embedding_mode=(attachments_embedding_mode)
      validator = EnumAttributeValidator.new('String', ["None", "Annotations", "DocumentEmbeddedFiles"])
      if attachments_embedding_mode.to_i == 0
        unless validator.valid?(attachments_embedding_mode)
          raise ArgumentError, "invalid value for 'attachments_embedding_mode', must be one of #{validator.allowable_values}."
        end
        @attachments_embedding_mode = attachments_embedding_mode
      else
        @attachments_embedding_mode = validator.allowable_values[attachments_embedding_mode.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] compliance Object to be assigned
    def compliance=(compliance)
      validator = EnumAttributeValidator.new('String', ["Pdf17", "Pdf20", "PdfA1a", "PdfA1b", "PdfA2a", "PdfA2u", "PdfA3a", "PdfA3u", "PdfA4", "PdfA4f", "PdfA4Ua2", "PdfUa1", "PdfUa2"])
      if compliance.to_i == 0
        unless validator.valid?(compliance)
          raise ArgumentError, "invalid value for 'compliance', must be one of #{validator.allowable_values}."
        end
        @compliance = compliance
      else
        @compliance = validator.allowable_values[compliance.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] custom_properties_export Object to be assigned
    def custom_properties_export=(custom_properties_export)
      validator = EnumAttributeValidator.new('String', ["None", "Standard", "Metadata"])
      if custom_properties_export.to_i == 0
        unless validator.valid?(custom_properties_export)
          raise ArgumentError, "invalid value for 'custom_properties_export', must be one of #{validator.allowable_values}."
        end
        @custom_properties_export = custom_properties_export
      else
        @custom_properties_export = validator.allowable_values[custom_properties_export.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] font_embedding_mode Object to be assigned
    def font_embedding_mode=(font_embedding_mode)
      validator = EnumAttributeValidator.new('String', ["EmbedAll", "EmbedNonstandard", "EmbedNone"])
      if font_embedding_mode.to_i == 0
        unless validator.valid?(font_embedding_mode)
          raise ArgumentError, "invalid value for 'font_embedding_mode', must be one of #{validator.allowable_values}."
        end
        @font_embedding_mode = font_embedding_mode
      else
        @font_embedding_mode = validator.allowable_values[font_embedding_mode.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] header_footer_bookmarks_export_mode Object to be assigned
    def header_footer_bookmarks_export_mode=(header_footer_bookmarks_export_mode)
      validator = EnumAttributeValidator.new('String', ["None", "First", "All"])
      if header_footer_bookmarks_export_mode.to_i == 0
        unless validator.valid?(header_footer_bookmarks_export_mode)
          raise ArgumentError, "invalid value for 'header_footer_bookmarks_export_mode', must be one of #{validator.allowable_values}."
        end
        @header_footer_bookmarks_export_mode = header_footer_bookmarks_export_mode
      else
        @header_footer_bookmarks_export_mode = validator.allowable_values[header_footer_bookmarks_export_mode.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] image_color_space_export_mode Object to be assigned
    def image_color_space_export_mode=(image_color_space_export_mode)
      validator = EnumAttributeValidator.new('String', ["Auto", "SimpleCmyk"])
      if image_color_space_export_mode.to_i == 0
        unless validator.valid?(image_color_space_export_mode)
          raise ArgumentError, "invalid value for 'image_color_space_export_mode', must be one of #{validator.allowable_values}."
        end
        @image_color_space_export_mode = image_color_space_export_mode
      else
        @image_color_space_export_mode = validator.allowable_values[image_color_space_export_mode.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] page_mode Object to be assigned
    def page_mode=(page_mode)
      validator = EnumAttributeValidator.new('String', ["UseNone", "UseOutlines", "UseThumbs", "FullScreen", "UseOC", "UseAttachments"])
      if page_mode.to_i == 0
        unless validator.valid?(page_mode)
          raise ArgumentError, "invalid value for 'page_mode', must be one of #{validator.allowable_values}."
        end
        @page_mode = page_mode
      else
        @page_mode = validator.allowable_values[page_mode.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] text_compression Object to be assigned
    def text_compression=(text_compression)
      validator = EnumAttributeValidator.new('String', ["None", "Flate"])
      if text_compression.to_i == 0
        unless validator.valid?(text_compression)
          raise ArgumentError, "invalid value for 'text_compression', must be one of #{validator.allowable_values}."
        end
        @text_compression = text_compression
      else
        @text_compression = validator.allowable_values[text_compression.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] zoom_behavior Object to be assigned
    def zoom_behavior=(zoom_behavior)
      validator = EnumAttributeValidator.new('String', ["None", "ZoomFactor", "FitPage", "FitWidth", "FitHeight", "FitBox"])
      if zoom_behavior.to_i == 0
        unless validator.valid?(zoom_behavior)
          raise ArgumentError, "invalid value for 'zoom_behavior', must be one of #{validator.allowable_values}."
        end
        @zoom_behavior = zoom_behavior
      else
        @zoom_behavior = validator.allowable_values[zoom_behavior.to_i]
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
          attachments_embedding_mode == other.attachments_embedding_mode &&
          cache_background_graphics == other.cache_background_graphics &&
          compliance == other.compliance &&
          create_note_hyperlinks == other.create_note_hyperlinks &&
          custom_properties_export == other.custom_properties_export &&
          digital_signature_details == other.digital_signature_details &&
          display_doc_title == other.display_doc_title &&
          downsample_options == other.downsample_options &&
          embed_attachments == other.embed_attachments &&
          embed_full_fonts == other.embed_full_fonts &&
          encryption_details == other.encryption_details &&
          export_document_structure == other.export_document_structure &&
          export_language_to_span_tag == other.export_language_to_span_tag &&
          font_embedding_mode == other.font_embedding_mode &&
          generate_form_field_scripts == other.generate_form_field_scripts &&
          header_footer_bookmarks_export_mode == other.header_footer_bookmarks_export_mode &&
          image_color_space_export_mode == other.image_color_space_export_mode &&
          image_compression == other.image_compression &&
          interpolate_images == other.interpolate_images &&
          open_hyperlinks_in_new_window == other.open_hyperlinks_in_new_window &&
          outline_options == other.outline_options &&
          page_mode == other.page_mode &&
          preblend_images == other.preblend_images &&
          preserve_form_fields == other.preserve_form_fields &&
          render_choice_form_field_border == other.render_choice_form_field_border &&
          text_compression == other.text_compression &&
          use_book_fold_printing_settings == other.use_book_fold_printing_settings &&
          use_core_fonts == other.use_core_fonts &&
          use_sdt_tag_as_form_field_name == other.use_sdt_tag_as_form_field_name &&
          zoom_behavior == other.zoom_behavior &&
          zoom_factor == other.zoom_factor &&
          export_floating_shapes_as_inline_tag == other.export_floating_shapes_as_inline_tag &&
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
      [allow_embedding_post_script_fonts, custom_time_zone_info_data, dml3_d_effects_rendering_mode, dml_effects_rendering_mode, dml_rendering_mode, file_name, iml_rendering_mode, update_ambiguous_text_font, update_created_time_property, update_fields, update_last_printed_property, update_last_saved_time_property, zip_output, color_mode, jpeg_quality, metafile_rendering_options, numeral_format, optimize_output, page_count, page_index, attachments_embedding_mode, cache_background_graphics, compliance, create_note_hyperlinks, custom_properties_export, digital_signature_details, display_doc_title, downsample_options, embed_attachments, embed_full_fonts, encryption_details, export_document_structure, export_language_to_span_tag, font_embedding_mode, generate_form_field_scripts, header_footer_bookmarks_export_mode, image_color_space_export_mode, image_compression, interpolate_images, open_hyperlinks_in_new_window, outline_options, page_mode, preblend_images, preserve_form_fields, render_choice_form_field_border, text_compression, use_book_fold_printing_settings, use_core_fonts, use_sdt_tag_as_form_field_name, zoom_behavior, zoom_factor, export_floating_shapes_as_inline_tag, save_format].hash
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
      raise ArgumentError, 'Property file_name in PdfSaveOptionsData is required.' if self.file_name.nil?
      unless self.custom_time_zone_info_data.nil?
          self.custom_time_zone_info_data.validate
      end
      unless self.metafile_rendering_options.nil?
          self.metafile_rendering_options.validate
      end
      unless self.digital_signature_details.nil?
          self.digital_signature_details.validate
      end
      unless self.downsample_options.nil?
          self.downsample_options.validate
      end
      unless self.encryption_details.nil?
          self.encryption_details.validate
      end
      unless self.outline_options.nil?
          self.outline_options.validate
      end

    end

  end
end
