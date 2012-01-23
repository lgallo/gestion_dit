require 'test_helper'

class TiposRequerimientosControllerTest < ActionController::TestCase
  setup do
    @tipo_requerimiento = tipos_requerimientos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipos_requerimientos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_requerimiento" do
    assert_difference('TipoRequerimiento.count') do
      post :create, tipo_requerimiento: @tipo_requerimiento.attributes
    end

    assert_redirected_to tipo_requerimiento_path(assigns(:tipo_requerimiento))
  end

  test "should show tipo_requerimiento" do
    get :show, id: @tipo_requerimiento.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_requerimiento.to_param
    assert_response :success
  end

  test "should update tipo_requerimiento" do
    put :update, id: @tipo_requerimiento.to_param, tipo_requerimiento: @tipo_requerimiento.attributes
    assert_redirected_to tipo_requerimiento_path(assigns(:tipo_requerimiento))
  end

  test "should destroy tipo_requerimiento" do
    assert_difference('TipoRequerimiento.count', -1) do
      delete :destroy, id: @tipo_requerimiento.to_param
    end

    assert_redirected_to tipos_requerimientos_path
  end
end
