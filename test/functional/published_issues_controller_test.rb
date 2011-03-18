require 'test_helper'

class PublishedIssuesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:published_issues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create published_issue" do
    assert_difference('PublishedIssue.count') do
      post :create, :published_issue => { }
    end

    assert_redirected_to published_issue_path(assigns(:published_issue))
  end

  test "should show published_issue" do
    get :show, :id => published_issues(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => published_issues(:one).to_param
    assert_response :success
  end

  test "should update published_issue" do
    put :update, :id => published_issues(:one).to_param, :published_issue => { }
    assert_redirected_to published_issue_path(assigns(:published_issue))
  end

  test "should destroy published_issue" do
    assert_difference('PublishedIssue.count', -1) do
      delete :destroy, :id => published_issues(:one).to_param
    end

    assert_redirected_to published_issues_path
  end
end
