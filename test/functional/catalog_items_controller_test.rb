require 'test_helper'

class CatalogItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:catalog_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create catalog_item" do
    assert_difference('CatalogItem.count') do
      post :create, :catalog_item => { }
    end

    assert_redirected_to catalog_item_path(assigns(:catalog_item))
  end

  test "should show catalog_item" do
    get :show, :id => catalog_items(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => catalog_items(:one).to_param
    assert_response :success
  end

  test "should update catalog_item" do
    put :update, :id => catalog_items(:one).to_param, :catalog_item => { }
    assert_redirected_to catalog_item_path(assigns(:catalog_item))
  end

  test "should destroy catalog_item" do
    assert_difference('CatalogItem.count', -1) do
      delete :destroy, :id => catalog_items(:one).to_param
    end

    assert_redirected_to catalog_items_path
  end
end
