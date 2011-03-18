require 'test_helper'

class ProfileAddonsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profile_addons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile_addon" do
    assert_difference('ProfileAddon.count') do
      post :create, :profile_addon => { }
    end

    assert_redirected_to profile_addon_path(assigns(:profile_addon))
  end

  test "should show profile_addon" do
    get :show, :id => profile_addons(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => profile_addons(:one).to_param
    assert_response :success
  end

  test "should update profile_addon" do
    put :update, :id => profile_addons(:one).to_param, :profile_addon => { }
    assert_redirected_to profile_addon_path(assigns(:profile_addon))
  end

  test "should destroy profile_addon" do
    assert_difference('ProfileAddon.count', -1) do
      delete :destroy, :id => profile_addons(:one).to_param
    end

    assert_redirected_to profile_addons_path
  end
end
