require 'test_helper'

class PaymentsAchesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payments_aches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payments_ach" do
    assert_difference('PaymentsAch.count') do
      post :create, :payments_ach => { }
    end

    assert_redirected_to payments_ach_path(assigns(:payments_ach))
  end

  test "should show payments_ach" do
    get :show, :id => payments_aches(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => payments_aches(:one).to_param
    assert_response :success
  end

  test "should update payments_ach" do
    put :update, :id => payments_aches(:one).to_param, :payments_ach => { }
    assert_redirected_to payments_ach_path(assigns(:payments_ach))
  end

  test "should destroy payments_ach" do
    assert_difference('PaymentsAch.count', -1) do
      delete :destroy, :id => payments_aches(:one).to_param
    end

    assert_redirected_to payments_aches_path
  end
end
