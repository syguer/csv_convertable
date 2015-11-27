class MultilineCSVFormat < CsvConvertable::Format
  define_row do
    column :name

    define_row do
      column :car_name, :name
      column :car_number, :number
    end
  end
end
