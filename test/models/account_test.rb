require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  should have_db_column(:id).of_type(:integer).with_options(primary: true, null: false)
  should have_db_column(:name).of_type(:string).with_options(null: false)
  should have_db_column(:slug).of_type(:string).with_options(null: false)

  should have_db_index(:slug)

  should have_many(:projects)

  should validate_presence_of(:name)

  test "if sets slug before_save" do
    account = Account.new(name: "Hello World")
    account.save!
    assert_equal "hello-world", account.slug
  end
end
