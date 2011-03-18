require 'test_helper'

class PaymentChecksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payment_checks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment_check" do
    assert_difference('PaymentCheck.count') do
      post :create, :payment_check => { }
    end

    assert_redirected_to payment_check_path(assigns(:payment_check))
  end

  test "should show payment_check" do
    get :show, :id => payment_checks(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => payment_checks(:one).to_param
    assert_response :success
  end

  test "should update payment_check" do
    put :update, :id => payment_checks(:one).to_param, :payment_check => { }
    assert_redirected_to payment_check_path(assigns(:payment_check))
  end

  test "should destroy payment_check" do
    assert_difference('PaymentCheck.count', -1) do
      delete :destroy, :id => payment_checks(:one).to_param
    end

    assert_redirected_to payment_checks_path
  end
end
