require 'test_helper'

class ShippingDetailsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shipping_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shipping_detail" do
    assert_difference('ShippingDetail.count') do
      post :create, :shipping_detail => { }
    end

    assert_redirected_to shipping_detail_path(assigns(:shipping_detail))
  end

  test "should show shipping_detail" do
    get :show, :id => shipping_details(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => shipping_details(:one).to_param
    assert_response :success
  end

  test "should update shipping_detail" do
    put :update, :id => shipping_details(:one).to_param, :shipping_detail => { }
    assert_redirected_to shipping_detail_path(assigns(:shipping_detail))
  end

  test "should destroy shipping_detail" do
    assert_difference('ShippingDetail.count', -1) do
      delete :destroy, :id => shipping_details(:one).to_param
    end

    assert_redirected_to shipping_details_path
  end
end
