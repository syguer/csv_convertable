module CsvConvertable
  module ActiveModel
    module CsvConvertable
      def self.included(klass)
        klass.extend ClassMethods
      end

      module ClassMethods
        def csv_convertable_with module_klass
          unless module_klass.is_a? CsvConvertable::Format
            fail ArumentError, "invalid argument is passed to #csv_convertable_with"
          end

          module_klass.apply_csv_format self
        end
      end
    end
  end
end
