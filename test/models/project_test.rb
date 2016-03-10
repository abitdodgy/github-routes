require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  should have_db_column(:id).of_type(:integer).with_options(primary: true, null: false)
  should have_db_column(:name).of_type(:string).with_options(null: false)
  should have_db_column(:slug).of_type(:string).with_options(null: false)

  should have_db_index(:slug)
  should have_db_index([:account_id, :slug]).unique(true)
end
