require 'test_helper'

class CashDetailsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cash_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cash_detail" do
    assert_difference('CashDetail.count') do
      post :create, :cash_detail => { }
    end

    assert_redirected_to cash_detail_path(assigns(:cash_detail))
  end

  test "should show cash_detail" do
    get :show, :id => cash_details(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cash_details(:one).to_param
    assert_response :success
  end

  test "should update cash_detail" do
    put :update, :id => cash_details(:one).to_param, :cash_detail => { }
    assert_redirected_to cash_detail_path(assigns(:cash_detail))
  end

  test "should destroy cash_detail" do
    assert_difference('CashDetail.count', -1) do
      delete :destroy, :id => cash_details(:one).to_param
    end

    assert_redirected_to cash_details_path
  end
end
