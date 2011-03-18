require 'test_helper'

class PaymentCcsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payment_ccs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment_cc" do
    assert_difference('PaymentCc.count') do
      post :create, :payment_cc => { }
    end

    assert_redirected_to payment_cc_path(assigns(:payment_cc))
  end

  test "should show payment_cc" do
    get :show, :id => payment_ccs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => payment_ccs(:one).to_param
    assert_response :success
  end

  test "should update payment_cc" do
    put :update, :id => payment_ccs(:one).to_param, :payment_cc => { }
    assert_redirected_to payment_cc_path(assigns(:payment_cc))
  end

  test "should destroy payment_cc" do
    assert_difference('PaymentCc.count', -1) do
      delete :destroy, :id => payment_ccs(:one).to_param
    end

    assert_redirected_to payment_ccs_path
  end
end
