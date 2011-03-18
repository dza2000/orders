require 'test_helper'

class CheckDetailsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:check_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create check_detail" do
    assert_difference('CheckDetail.count') do
      post :create, :check_detail => { }
    end

    assert_redirected_to check_detail_path(assigns(:check_detail))
  end

  test "should show check_detail" do
    get :show, :id => check_details(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => check_details(:one).to_param
    assert_response :success
  end

  test "should update check_detail" do
    put :update, :id => check_details(:one).to_param, :check_detail => { }
    assert_redirected_to check_detail_path(assigns(:check_detail))
  end

  test "should destroy check_detail" do
    assert_difference('CheckDetail.count', -1) do
      delete :destroy, :id => check_details(:one).to_param
    end

    assert_redirected_to check_details_path
  end
end
