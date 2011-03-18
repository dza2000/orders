require 'test_helper'

class PaymentReceiptsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payment_receipts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment_receipt" do
    assert_difference('PaymentReceipt.count') do
      post :create, :payment_receipt => { }
    end

    assert_redirected_to payment_receipt_path(assigns(:payment_receipt))
  end

  test "should show payment_receipt" do
    get :show, :id => payment_receipts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => payment_receipts(:one).to_param
    assert_response :success
  end

  test "should update payment_receipt" do
    put :update, :id => payment_receipts(:one).to_param, :payment_receipt => { }
    assert_redirected_to payment_receipt_path(assigns(:payment_receipt))
  end

  test "should destroy payment_receipt" do
    assert_difference('PaymentReceipt.count', -1) do
      delete :destroy, :id => payment_receipts(:one).to_param
    end

    assert_redirected_to payment_receipts_path
  end
end
