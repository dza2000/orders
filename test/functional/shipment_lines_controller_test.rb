require 'test_helper'

class ShipmentLinesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shipment_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shipment_line" do
    assert_difference('ShipmentLine.count') do
      post :create, :shipment_line => { }
    end

    assert_redirected_to shipment_line_path(assigns(:shipment_line))
  end

  test "should show shipment_line" do
    get :show, :id => shipment_lines(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => shipment_lines(:one).to_param
    assert_response :success
  end

  test "should update shipment_line" do
    put :update, :id => shipment_lines(:one).to_param, :shipment_line => { }
    assert_redirected_to shipment_line_path(assigns(:shipment_line))
  end

  test "should destroy shipment_line" do
    assert_difference('ShipmentLine.count', -1) do
      delete :destroy, :id => shipment_lines(:one).to_param
    end

    assert_redirected_to shipment_lines_path
  end
end
