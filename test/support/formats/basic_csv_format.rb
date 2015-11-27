class BasicCSVFormat < CsvConvertable::Format
  define_row do
    column :name

    column :email

    column "hoge", :name

    column :created_date do |object|
      object.created_at.strftime "%Y/%m/%d"
    end
  end
end
