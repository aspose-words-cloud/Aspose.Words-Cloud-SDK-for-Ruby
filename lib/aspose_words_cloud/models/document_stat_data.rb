# ------------------------------------------------------------------------------------
# <copyright company="Aspose" file="document_stat_data.rb">
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

  # Container for the document's statistical data.
  class DocumentStatData
    # Gets or sets the detailed statistics on footnotes.
    attr_accessor :footnotes_stat_data


    # Gets or sets the total count of pages in the document.
    attr_accessor :page_count


    # Gets or sets the total count of paragraphs in the document.
    attr_accessor :paragraph_count


    # Gets or sets the total count of words in the document.
    attr_accessor :word_count


    # Gets or sets the detailed statistics on all pages.
    attr_accessor :page_stat_data

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'footnotes_stat_data' => :'FootnotesStatData',
        :'page_count' => :'PageCount',
        :'paragraph_count' => :'ParagraphCount',
        :'word_count' => :'WordCount',
        :'page_stat_data' => :'PageStatData'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'footnotes_stat_data' => :'FootnotesStatData',
        :'page_count' => :'Integer',
        :'paragraph_count' => :'Integer',
        :'word_count' => :'Integer',
        :'page_stat_data' => :'Array<PageStatData>'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.key?(:'FootnotesStatData')
        self.footnotes_stat_data = attributes[:'FootnotesStatData']
      end

      if attributes.key?(:'PageCount')
        self.page_count = attributes[:'PageCount']
      end

      if attributes.key?(:'ParagraphCount')
        self.paragraph_count = attributes[:'ParagraphCount']
      end

      if attributes.key?(:'WordCount')
        self.word_count = attributes[:'WordCount']
      end

      if attributes.key?(:'PageStatData')
        if (value = attributes[:'PageStatData']).is_a?(Array)
          self.page_stat_data = value
        end
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
          footnotes_stat_data == other.footnotes_stat_data &&
          page_count == other.page_count &&
          paragraph_count == other.paragraph_count &&
          word_count == other.word_count &&
          page_stat_data == other.page_stat_data
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [footnotes_stat_data, page_count, paragraph_count, word_count, page_stat_data].hash
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
      raise ArgumentError, 'Property page_count in DocumentStatData is required.' if self.page_count.nil?
      raise ArgumentError, 'Property paragraph_count in DocumentStatData is required.' if self.paragraph_count.nil?
      raise ArgumentError, 'Property word_count in DocumentStatData is required.' if self.word_count.nil?
      unless self.footnotes_stat_data.nil?
          self.footnotes_stat_data.validate
      end
      unless self.page_stat_data.nil?
          for elementPageStatData in self.page_stat_data
              unless elementPageStatData.nil?
                  elementPageStatData.validate
              end
          end
      end

    end

  end
end
