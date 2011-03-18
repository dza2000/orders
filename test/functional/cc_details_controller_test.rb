require 'test_helper'

class CcDetailsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cc_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cc_detail" do
    assert_difference('CcDetail.count') do
      post :create, :cc_detail => { }
    end

    assert_redirected_to cc_detail_path(assigns(:cc_detail))
  end

  test "should show cc_detail" do
    get :show, :id => cc_details(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cc_details(:one).to_param
    assert_response :success
  end

  test "should update cc_detail" do
    put :update, :id => cc_details(:one).to_param, :cc_detail => { }
    assert_redirected_to cc_detail_path(assigns(:cc_detail))
  end

  test "should destroy cc_detail" do
    assert_difference('CcDetail.count', -1) do
      delete :destroy, :id => cc_details(:one).to_param
    end

    assert_redirected_to cc_details_path
  end
end
