require 'test_helper'

class SubscriptionTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subscription_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subscription_type" do
    assert_difference('SubscriptionType.count') do
      post :create, :subscription_type => { }
    end

    assert_redirected_to subscription_type_path(assigns(:subscription_type))
  end

  test "should show subscription_type" do
    get :show, :id => subscription_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => subscription_types(:one).to_param
    assert_response :success
  end

  test "should update subscription_type" do
    put :update, :id => subscription_types(:one).to_param, :subscription_type => { }
    assert_redirected_to subscription_type_path(assigns(:subscription_type))
  end

  test "should destroy subscription_type" do
    assert_difference('SubscriptionType.count', -1) do
      delete :destroy, :id => subscription_types(:one).to_param
    end

    assert_redirected_to subscription_types_path
  end
end
