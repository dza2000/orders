require 'test_helper'

class SourceCodeTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:source_code_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create source_code_type" do
    assert_difference('SourceCodeType.count') do
      post :create, :source_code_type => { }
    end

    assert_redirected_to source_code_type_path(assigns(:source_code_type))
  end

  test "should show source_code_type" do
    get :show, :id => source_code_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => source_code_types(:one).to_param
    assert_response :success
  end

  test "should update source_code_type" do
    put :update, :id => source_code_types(:one).to_param, :source_code_type => { }
    assert_redirected_to source_code_type_path(assigns(:source_code_type))
  end

  test "should destroy source_code_type" do
    assert_difference('SourceCodeType.count', -1) do
      delete :destroy, :id => source_code_types(:one).to_param
    end

    assert_redirected_to source_code_types_path
  end
end
