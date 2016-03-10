require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
    @account = @project.account
  end

  test "GET #show" do
    get :show, { account_id: @account, id: @project }
    assert_response :success
  end

  test "GET #new" do
    get :new, { account_id: @account }
    assert_response :success
  end

  test "POST #create with invalid info" do
    assert_no_difference '@account.projects.count' do
      post :create, { account_id: @account, project: { name: '' } }
    end
    assert_response :success
  end

  test "POST #create with valid info" do
    assert_difference '@account.projects.count', 1 do
      post :create, { account_id: @account, project: { name: 'New Project' } }
    end
    assert_redirected_to account_project_path(@account, @account.projects.last)
  end

  test "GET #edit" do
    get :edit, { account_id: @account, id: @project }
    assert_response :success
  end

  test "PATCH #update with invalid info" do
    patch :update, { account_id: @account, id: @project, project: { name: '' } }
    assert @project.reload.name.present?
    assert_response :success
  end

  test "PATCH #update with valid info" do
    patch :update, { account_id: @account, id: @project, project: { name: 'New Name' } }
    assert_equal "New Name", @project.reload.name
    assert_redirected_to account_project_path(@account, @project)
  end

  test "DELETE #destroy" do
    assert_difference '@account.projects.count', -1 do
      delete :destroy, { account_id: @account, id: @project }
    end
    assert_redirected_to account_path(@account)
  end
end
