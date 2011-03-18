require 'test_helper'

class TransactionReceiptsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transaction_receipts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaction_receipt" do
    assert_difference('TransactionReceipt.count') do
      post :create, :transaction_receipt => { }
    end

    assert_redirected_to transaction_receipt_path(assigns(:transaction_receipt))
  end

  test "should show transaction_receipt" do
    get :show, :id => transaction_receipts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => transaction_receipts(:one).to_param
    assert_response :success
  end

  test "should update transaction_receipt" do
    put :update, :id => transaction_receipts(:one).to_param, :transaction_receipt => { }
    assert_redirected_to transaction_receipt_path(assigns(:transaction_receipt))
  end

  test "should destroy transaction_receipt" do
    assert_difference('TransactionReceipt.count', -1) do
      delete :destroy, :id => transaction_receipts(:one).to_param
    end

    assert_redirected_to transaction_receipts_path
  end
end
