module Destinations
  module GpcClassifications
    class Attributes < Base

      def write(row)
        return if row[:segment_code].blank?

        segment = find_or_create_segment(row)
        family = find_or_create_family(row, segment)
        klass = find_or_create_klass(row, family)

        return if row[:brick_code].blank?

        attribute_type = find_or_create_core_attribute_type(row)
        attribute_value = find_or_create_core_attribute_value(row)
        brick = find_or_create_brick(row, klass)
    
        bind_brick_to_attribute_type_and_value(
          brick,
          attribute_type,
          attribute_value
        )

        @count += 1

        puts @count
        
      rescue Exception => e      
        puts Thread.current.backtrace.join("\n")
        puts "Row - #{row}"
        raise
      end
  
      private

      def bind_brick_to_attribute_type_and_value(brick, attribute_type, attribute_value)
        return nil if brick.blank?
        return nil if attribute_type.blank?

        Gpc::BrickAttributeTypeAttributeValue.find_or_create_by(
          brick: brick, 
          attribute_type: attribute_type,
          attribute_value: attribute_value
        )
      end

      def find_or_create_core_attribute_type(row)
        return nil if row[:core_attribute_type_code].blank?

        attribute_types[row[:core_attribute_type_code]] ||= \
          Gpc::AttributeType.find_or_create_by(code: row[:core_attribute_type_code]) do |gpc_attribute|
            gpc_attribute.description = row[:core_attribute_type_description]
          end
      end

      def find_or_create_core_attribute_value(row)
        return nil if row[:core_attribute_value_code].blank?

        attribute_values[row[:core_attribute_value_code]] ||= \
          Gpc::AttributeValue.find_or_create_by(code: row[:core_attribute_value_code]) do |klass|
            klass.description = row[:core_attribute_value_description]
          end
      end
    end
  end
end
