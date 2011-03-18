require 'test_helper'

class SegmentDetailsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:segment_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create segment_detail" do
    assert_difference('SegmentDetail.count') do
      post :create, :segment_detail => { }
    end

    assert_redirected_to segment_detail_path(assigns(:segment_detail))
  end

  test "should show segment_detail" do
    get :show, :id => segment_details(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => segment_details(:one).to_param
    assert_response :success
  end

  test "should update segment_detail" do
    put :update, :id => segment_details(:one).to_param, :segment_detail => { }
    assert_redirected_to segment_detail_path(assigns(:segment_detail))
  end

  test "should destroy segment_detail" do
    assert_difference('SegmentDetail.count', -1) do
      delete :destroy, :id => segment_details(:one).to_param
    end

    assert_redirected_to segment_details_path
  end
end
