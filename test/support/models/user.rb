class User < ActiveRecord::Base
  has_many :cars, dependent: :destroy

  csv_convertable_with BasicCSVFormat
end
