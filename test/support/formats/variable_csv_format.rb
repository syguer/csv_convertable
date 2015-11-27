class VariableCSVFormat < CsvConvertable::Format
  define_row do
    column :name

    variable_columns :cars do |car|
      column :car_name, :name
      column :car_number, :number
    end
  end
end
