require 'test_helper'

class GivingGroupsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:giving_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create giving_group" do
    assert_difference('GivingGroup.count') do
      post :create, :giving_group => { }
    end

    assert_redirected_to giving_group_path(assigns(:giving_group))
  end

  test "should show giving_group" do
    get :show, :id => giving_groups(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => giving_groups(:one).to_param
    assert_response :success
  end

  test "should update giving_group" do
    put :update, :id => giving_groups(:one).to_param, :giving_group => { }
    assert_redirected_to giving_group_path(assigns(:giving_group))
  end

  test "should destroy giving_group" do
    assert_difference('GivingGroup.count', -1) do
      delete :destroy, :id => giving_groups(:one).to_param
    end

    assert_redirected_to giving_groups_path
  end
end
