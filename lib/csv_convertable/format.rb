module CsvConvertable
  class Format
    def self.apply_csv_format(klass)
    end

    def self.define_row
      yield
    end

    def self.column(name, &block)
      header << name

      if block_given?
        block.call()
      end
    end

    def self.header
      @header ||= []
    end
  end
end
