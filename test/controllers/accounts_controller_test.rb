require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
  test "GET #index" do
    get :index
    assert_response :success
  end
end
