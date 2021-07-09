module Destinations

  module GpcClassifications
    class Bricks < Base

      def write(row)
        return if row[:segment_code].blank?

        segment = find_or_create_segment(row)
        family = find_or_create_family(row, segment)
        klass = find_or_create_klass(row, family)

        return if row[:brick_code].blank?

        brick = find_or_create_brick(row, klass)

        extract_core_attributes(row).each do |attribute_data|     
          bind_brick_to_attribute_type(
            brick, 
            find_or_create_attribute_type(attribute_data)  
          )
        end
        
      rescue Exception => e      
        puts Thread.current.backtrace.join("\n")
        puts "Row - #{row}"
        raise
      end

      private

      def bind_brick_to_attribute_type(brick, attribute_type)
        return nil if attribute_type.blank?

        Gpc::BrickAttributeTypeAttributeValue.find_or_create_by(
          brick: brick, 
          attribute_type: attribute_type
        )
      end

      def find_or_create_attribute_type(data)
        return nil if data[:code].blank?

        attribute_types[data[:code]] ||= \
          Gpc::AttributeType.find_or_create_by(code: data[:code]) do |gpc_attribute|
            gpc_attribute.description = data[:description]
          end
      end

      ATTRIBUTE_KEY_REGEX = /\Acore_attribute_type_\d+_(description|code)/

      # Expect attributes in the following format:
      #
      # {
      #   ...
      #   :core_attribute_type_1_code=>nil,
      #   :core_attribute_type_1_description=>nil,
      #   :core_attribute_type_2_code=>nil,
      #   :core_attribute_type_2_description=>nil,
      #   ...
      # }
      #
      # Returns array of { code: '', description: '' } hashes
      def extract_core_attributes(row)
        row
          .select { |k, _v| ATTRIBUTE_KEY_REGEX.match(k.to_s) }
          .each_slice(2)
          .take_while { |(code_data, _desc_data)| code_data.second.present? }
          .each_with_object([]) do |(code_data, desc_data), memo|
            memo << { code: code_data.second, description: desc_data.second }
          end
      end
    end
  end
end
