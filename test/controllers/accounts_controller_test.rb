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

  test "GET #new" do
    get :new
    assert_response :success
  end

  test "POST #create with invalid info" do
    assert_no_difference 'Account.count' do
      post :create, { account: { name: '' } }
    end
    assert_response :success
  end

  test "POST #create with valid info" do
    assert_difference 'Account.count', 1 do
      post :create, { account: { name: 'New Account' } }
    end
    account = Account.last
    assert_equal 'New Account', account.name
    assert_redirected_to account_path(account)
  end

  test "GET #edit" do
    get :edit, id: @account
    assert_response :success
  end

  test "PATCH #update with invalid info" do
    patch :update, {id: @account, account: { name: '' } }
    assert @account.reload.name.present?
    assert_response :success
  end

  test "PATCH #update with valid info" do
    patch :update, {id: @account, account: { name: 'New Name' } }
    assert_equal "New Name", @account.reload.name
    assert_redirected_to account_path(@account)
  end

  test "DELETE #destroy" do
    assert_difference 'Account.count', -1 do
      delete :destroy, id: @account
    end
    assert_redirected_to root_path
  end
end
