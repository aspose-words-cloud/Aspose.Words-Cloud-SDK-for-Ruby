# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="table_cell_format.rb">
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

  # DTO container with all formatting for a table row.
  class TableCellFormat
    # Gets or sets the link to the document.
    attr_accessor :link


    # Gets or sets the amount of space (in points) to add below the contents of the cell.
    attr_accessor :bottom_padding


    # Gets or sets a value indicating whether to fit text in the cell, compress each paragraph to the width of the cell.
    attr_accessor :fit_text


    # Gets or sets the option that controls how the cell is merged horizontally with other cells in the row.
    attr_reader :horizontal_merge


    # Gets or sets the amount of space (in points) to add to the left of the contents of the cell.
    attr_accessor :left_padding


    # Gets or sets the orientation of text in a table cell.
    attr_reader :orientation


    # Gets or sets the preferred width of the cell.
    # The preferred width (along with the table's Auto Fit option) determines how the actual width of the cell is calculated by the table layout algorithm. Table layout can be performed by Aspose.Words when it saves the document or by Microsoft Word when it displays the document.The preferred width can be specified in points or in percent. The preferred width can also be specified as "auto", which means no preferred width is specified.The default value is Auto.
    attr_accessor :preferred_width


    # Gets or sets the amount of space (in points) to add to the right of the contents of the cell.
    attr_accessor :right_padding


    # Gets or sets the amount of space (in points) to add above the contents of the cell.
    attr_accessor :top_padding


    # Gets or sets the vertical alignment of text in the cell.
    attr_reader :vertical_alignment


    # Gets or sets the option that controls how the cell is merged with other cells vertically.
    # Cells can only be merged vertically if their left and right boundaries are identical.When cells are vertically merged, the display areas of the merged cells are consolidated. The consolidated area is used to display the contents of the first vertically merged cell and all other vertically merged cells must be empty.
    attr_reader :vertical_merge


    # Gets or sets the width of the cell in points.
    # The width is calculated by Aspose.Words on document loading and saving. Currently, not every combination of table, cell and document properties is supported. The returned value may not be accurate for some documents. It may not exactly match the cell width as calculated by MS Word when the document is opened in MS Word.Setting this property is not recommended. There is no guarantee that the cell will actually have the set width. The width may be adjusted to accommodate cell contents in an auto-fit table layout. Cells in other rows may have conflicting width settings. The table may be resized to fit into the container or to meet table width settings. Consider using PreferredWidth for setting the cell width. Setting this property sets PreferredWidth implicitly since version 15.8.
    attr_accessor :width


    # Gets or sets a value indicating whether to wrap text in the cell.
    attr_accessor :wrap_text


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
        :'bottom_padding' => :'BottomPadding',
        :'fit_text' => :'FitText',
        :'horizontal_merge' => :'HorizontalMerge',
        :'left_padding' => :'LeftPadding',
        :'orientation' => :'Orientation',
        :'preferred_width' => :'PreferredWidth',
        :'right_padding' => :'RightPadding',
        :'top_padding' => :'TopPadding',
        :'vertical_alignment' => :'VerticalAlignment',
        :'vertical_merge' => :'VerticalMerge',
        :'width' => :'Width',
        :'wrap_text' => :'WrapText'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'link' => :'WordsApiLink',
        :'bottom_padding' => :'Float',
        :'fit_text' => :'BOOLEAN',
        :'horizontal_merge' => :'String',
        :'left_padding' => :'Float',
        :'orientation' => :'String',
        :'preferred_width' => :'PreferredWidth',
        :'right_padding' => :'Float',
        :'top_padding' => :'Float',
        :'vertical_alignment' => :'String',
        :'vertical_merge' => :'String',
        :'width' => :'Float',
        :'wrap_text' => :'BOOLEAN'
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

      if attributes.key?(:'BottomPadding')
        self.bottom_padding = attributes[:'BottomPadding']
      end

      if attributes.key?(:'FitText')
        self.fit_text = attributes[:'FitText']
      end

      if attributes.key?(:'HorizontalMerge')
        self.horizontal_merge = attributes[:'HorizontalMerge']
      end

      if attributes.key?(:'LeftPadding')
        self.left_padding = attributes[:'LeftPadding']
      end

      if attributes.key?(:'Orientation')
        self.orientation = attributes[:'Orientation']
      end

      if attributes.key?(:'PreferredWidth')
        self.preferred_width = attributes[:'PreferredWidth']
      end

      if attributes.key?(:'RightPadding')
        self.right_padding = attributes[:'RightPadding']
      end

      if attributes.key?(:'TopPadding')
        self.top_padding = attributes[:'TopPadding']
      end

      if attributes.key?(:'VerticalAlignment')
        self.vertical_alignment = attributes[:'VerticalAlignment']
      end

      if attributes.key?(:'VerticalMerge')
        self.vertical_merge = attributes[:'VerticalMerge']
      end

      if attributes.key?(:'Width')
        self.width = attributes[:'Width']
      end

      if attributes.key?(:'WrapText')
        self.wrap_text = attributes[:'WrapText']
      end
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      horizontal_merge_validator = EnumAttributeValidator.new('String', ["None", "First", "Previous"])
      return false unless horizontal_merge_validator.valid?(@horizontal_merge)
      orientation_validator = EnumAttributeValidator.new('String', ["Horizontal", "Downward", "Upward", "HorizontalRotatedFarEast", "VerticalFarEast", "VerticalRotatedFarEast"])
      return false unless orientation_validator.valid?(@orientation)
      vertical_alignment_validator = EnumAttributeValidator.new('String', ["Top", "Center", "Bottom"])
      return false unless vertical_alignment_validator.valid?(@vertical_alignment)
      vertical_merge_validator = EnumAttributeValidator.new('String', ["None", "First", "Previous"])
      return false unless vertical_merge_validator.valid?(@vertical_merge)

      return true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] horizontal_merge Object to be assigned
    def horizontal_merge=(horizontal_merge)
      validator = EnumAttributeValidator.new('String', ["None", "First", "Previous"])
      if horizontal_merge.to_i == 0
        unless validator.valid?(horizontal_merge)
          raise ArgumentError, "invalid value for 'horizontal_merge', must be one of #{validator.allowable_values}."
        end
        @horizontal_merge = horizontal_merge
      else
        @horizontal_merge = validator.allowable_values[horizontal_merge.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] orientation Object to be assigned
    def orientation=(orientation)
      validator = EnumAttributeValidator.new('String', ["Horizontal", "Downward", "Upward", "HorizontalRotatedFarEast", "VerticalFarEast", "VerticalRotatedFarEast"])
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
    # @param [Object] vertical_alignment Object to be assigned
    def vertical_alignment=(vertical_alignment)
      validator = EnumAttributeValidator.new('String', ["Top", "Center", "Bottom"])
      if vertical_alignment.to_i == 0
        unless validator.valid?(vertical_alignment)
          raise ArgumentError, "invalid value for 'vertical_alignment', must be one of #{validator.allowable_values}."
        end
        @vertical_alignment = vertical_alignment
      else
        @vertical_alignment = validator.allowable_values[vertical_alignment.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] vertical_merge Object to be assigned
    def vertical_merge=(vertical_merge)
      validator = EnumAttributeValidator.new('String', ["None", "First", "Previous"])
      if vertical_merge.to_i == 0
        unless validator.valid?(vertical_merge)
          raise ArgumentError, "invalid value for 'vertical_merge', must be one of #{validator.allowable_values}."
        end
        @vertical_merge = vertical_merge
      else
        @vertical_merge = validator.allowable_values[vertical_merge.to_i]
      end
    end


    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(other)
      return true if self.equal?(other)
      self.class == other.class &&
          link == other.link &&
          bottom_padding == other.bottom_padding &&
          fit_text == other.fit_text &&
          horizontal_merge == other.horizontal_merge &&
          left_padding == other.left_padding &&
          orientation == other.orientation &&
          preferred_width == other.preferred_width &&
          right_padding == other.right_padding &&
          top_padding == other.top_padding &&
          vertical_alignment == other.vertical_alignment &&
          vertical_merge == other.vertical_merge &&
          width == other.width &&
          wrap_text == other.wrap_text
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [link, bottom_padding, fit_text, horizontal_merge, left_padding, orientation, preferred_width, right_padding, top_padding, vertical_alignment, vertical_merge, width, wrap_text].hash
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
