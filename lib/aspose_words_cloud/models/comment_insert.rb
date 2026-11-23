# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="comment_insert.rb">
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

  # Comment insert.
  class CommentInsert
    # Gets or sets the link to comment range start node.
    attr_accessor :range_start


    # Gets or sets the link to comment range end node.
    attr_accessor :range_end


    # Gets or sets the author name for a comment.
    # Cannot be null.Default is an empty string.
    attr_accessor :author


    # Gets or sets the initials of the user associated with a specific comment.
    # Cannot be null.Default is an empty string.
    attr_accessor :initial


    # Gets or sets the date and time that the comment was made.
    # Default is MinValue03.01.0001.
    attr_accessor :date_time


    # Gets or sets text of the comment.
    # This method allows to quickly set text of a comment from a string. The string can contain paragraph breaks, this will create paragraphs of text in the comment accordingly.
    attr_accessor :text

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'range_start' => :'RangeStart',
        :'range_end' => :'RangeEnd',
        :'author' => :'Author',
        :'initial' => :'Initial',
        :'date_time' => :'DateTime',
        :'text' => :'Text'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'range_start' => :'PositionInsideNode',
        :'range_end' => :'PositionInsideNode',
        :'author' => :'String',
        :'initial' => :'String',
        :'date_time' => :'DateTime',
        :'text' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.key?(:'RangeStart')
        self.range_start = attributes[:'RangeStart']
      end

      if attributes.key?(:'RangeEnd')
        self.range_end = attributes[:'RangeEnd']
      end

      if attributes.key?(:'Author')
        self.author = attributes[:'Author']
      end

      if attributes.key?(:'Initial')
        self.initial = attributes[:'Initial']
      end

      if attributes.key?(:'DateTime')
        self.date_time = attributes[:'DateTime']
      end

      if attributes.key?(:'Text')
        self.text = attributes[:'Text']
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
          range_start == other.range_start &&
          range_end == other.range_end &&
          author == other.author &&
          initial == other.initial &&
          date_time == other.date_time &&
          text == other.text
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [range_start, range_end, author, initial, date_time, text].hash
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
      raise ArgumentError, 'Property range_start in CommentInsert is required.' if self.range_start.nil?
      raise ArgumentError, 'Property range_end in CommentInsert is required.' if self.range_end.nil?
      raise ArgumentError, 'Property author in CommentInsert is required.' if self.author.nil?
      raise ArgumentError, 'Property initial in CommentInsert is required.' if self.initial.nil?
      raise ArgumentError, 'Property text in CommentInsert is required.' if self.text.nil?
      unless self.range_start.nil?
          self.range_start.validate
      end
      unless self.range_end.nil?
          self.range_end.validate
      end

    end

  end
end
