$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'csv_convertable'

require 'minitest/autorun'

require './formats/basic_csv_format'
require './formats/variable_csv_format'
require './formats/multiline_csv_format'

require './models/user'
require './models/car'

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")

def before_setup
  super

  ActiveRecord::Schema.define(version: 1) do
    create_table :users do |t|
      t.string :name
      t.string :email
    end
  end

  ActiveRecord::Schema.define(version: 1) do
    create_table :car do |t|
      t.string :user_id
      t.string :name
      t.string :number
    end
  end
end

def after_teardown
  ActiveRecord::Base.connection.tables.each do |table|
    ActiveRecord::Base.connection.drop_table(table)
  end

  super
end
