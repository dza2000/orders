require 'test_helper'

class RecurringGiftsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recurring_gifts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recurring_gift" do
    assert_difference('RecurringGift.count') do
      post :create, :recurring_gift => { }
    end

    assert_redirected_to recurring_gift_path(assigns(:recurring_gift))
  end

  test "should show recurring_gift" do
    get :show, :id => recurring_gifts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => recurring_gifts(:one).to_param
    assert_response :success
  end

  test "should update recurring_gift" do
    put :update, :id => recurring_gifts(:one).to_param, :recurring_gift => { }
    assert_redirected_to recurring_gift_path(assigns(:recurring_gift))
  end

  test "should destroy recurring_gift" do
    assert_difference('RecurringGift.count', -1) do
      delete :destroy, :id => recurring_gifts(:one).to_param
    end

    assert_redirected_to recurring_gifts_path
  end
end
