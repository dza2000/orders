require 'test_helper'

class ReceivedIssuesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:received_issues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create received_issue" do
    assert_difference('ReceivedIssue.count') do
      post :create, :received_issue => { }
    end

    assert_redirected_to received_issue_path(assigns(:received_issue))
  end

  test "should show received_issue" do
    get :show, :id => received_issues(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => received_issues(:one).to_param
    assert_response :success
  end

  test "should update received_issue" do
    put :update, :id => received_issues(:one).to_param, :received_issue => { }
    assert_redirected_to received_issue_path(assigns(:received_issue))
  end

  test "should destroy received_issue" do
    assert_difference('ReceivedIssue.count', -1) do
      delete :destroy, :id => received_issues(:one).to_param
    end

    assert_redirected_to received_issues_path
  end
end
