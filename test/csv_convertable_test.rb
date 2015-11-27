require 'test_helper'

class CsvConvertableTest < Minitest::Test
  def setup
    @user1 = User.new(name: "hoge", email: "foo@example.com")
    @user1.cars.create(name: "RX-7", number: "1234")
    @user1.cars.create(name: "R32", number: "5678")
    @user1.save

    @user2 = User.new(name: "hoge2", email: "foo2@example.com")
    @user2.cars.create(name: "RX-8", number: "4321")
    @user2.cars.create(name: "R34", number: "8765")
    @user2.save
  end

  def teardown
    User.destroy_all
  end

  def test_that_it_has_a_version_number
    refute_nil ::CsvConvertable::VERSION
  end

  def test_csv_header
    assert_equal ["name", "email", "hoge", "created_date"], User.csv_header
  end

  def test_to_csv_row
    assert_equal @user1.name, @user1.to_csv_row[0]
    assert_equal @user1.email, @user1.to_csv_row[1]
    assert_equal @user1.name, @user1.to_csv_row[2]
    assert_equal @user1.created_at.strftime("%Y/%m/%d"), @user1.to_csv_row[3]
  end

  def test_to_csv
    csv = User.all.to_csv
    assert_equal ["name", "email", "hoge", "created_date"], csv.header
    assert_equal @user1.to_csv_row, csv.shift
    assert_equal @user2.to_csv_row, csv.shift
  end
end
