require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
  setup do
    @account = accounts(:acme)
  end

  test "GET #index" do
    get :index
    assert_response :success
  end

  test "GET #show" do
    get :show, { id: @account }
    assert_response :success
  end
end
