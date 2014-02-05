require 'test_helper'

class MatrixContentTypesControllerTest < ActionController::TestCase
  setup do
    @matrix_content_type = matrix_content_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:matrix_content_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create matrix_content_type" do
    assert_difference('MatrixContentType.count') do
      post :create, matrix_content_type: { content_type_id: @matrix_content_type.content_type_id, matter_father_id: @matrix_content_type.matter_father_id, matter_id: @matrix_content_type.matter_id }
    end

    assert_redirected_to matrix_content_type_path(assigns(:matrix_content_type))
  end

  test "should show matrix_content_type" do
    get :show, id: @matrix_content_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @matrix_content_type
    assert_response :success
  end

  test "should update matrix_content_type" do
    put :update, id: @matrix_content_type, matrix_content_type: { content_type_id: @matrix_content_type.content_type_id, matter_father_id: @matrix_content_type.matter_father_id, matter_id: @matrix_content_type.matter_id }
    assert_redirected_to matrix_content_type_path(assigns(:matrix_content_type))
  end

  test "should destroy matrix_content_type" do
    assert_difference('MatrixContentType.count', -1) do
      delete :destroy, id: @matrix_content_type
    end

    assert_redirected_to matrix_content_types_path
  end
end
