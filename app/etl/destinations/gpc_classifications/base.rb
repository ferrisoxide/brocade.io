module Destinations

  module GpcClassifications
    class Base
      attr_reader :segments, :families, :klasses, :bricks, :attribute_types, :attribute_values

      private

      def initialize
        @segments = {}
        @families = {} 
        @klasses = {} 
        @bricks = {} 
        @attribute_types = {}
        @attribute_values = {}
        @count = 0
      end

      def find_or_create_segment(row)
        segments[row[:segment_code]] ||= \
          Gpc::Segment.find_or_create_by(code: row[:segment_code]) do |segment|
            segment.description = row[:segment_description]
          end
      end

      def find_or_create_family(row, segment)
        families[row[:family_code]] ||= \
          segment.families.find_or_create_by(code: row[:family_code]) do |family|
            family.description = row[:family_description]
          end
      end

      def find_or_create_klass(row, family)
        klasses[row[:class_code]] ||= \
          family.klasses.find_or_create_by(code: row[:class_code]) do |klass|
            klass.description = row[:class_description]
          end
      end

      def find_or_create_core_attribute(row)
        return nil if row[:core_attribute_type_code].blank?

        attributes[row[:core_attribute_type_code]] ||= \
          Gpc::Attribute.find_or_create_by(code: row[:core_attribute_type_code]) do |gpc_attribute|
            gpc_attribute.description = row[:core_attribute_type_description]
          end
      end

      def find_or_create_core_attribute_value(row, attribute)
        return nil if row[:core_attribute_value_code].blank?

        attribute_values[row[:core_attribute_value_code]] ||= \
          Gpc::AttributeValue.find_or_create_by(code: row[:core_attribute_value_code]) do |klass|
            klass.description = row[:core_attribute_value_description]
          end
      end

      def find_or_create_brick(row, klass, core_attribute=nil)
        bricks[row[:brick_code]] ||= \
          klass.bricks.find_or_create_by(code: row[:brick_code]) do |brick|
            brick.description = row[:brick_description]
          end.tap do |brick|
            if core_attribute.present? && brick.core_attribute != core_attribute
              brick.update(core_attribute: core_attribute) 
            end
          end
      end
    end
  end
end
