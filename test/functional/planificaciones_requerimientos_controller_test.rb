require 'test_helper'

class PlanificacionesRequerimientosControllerTest < ActionController::TestCase
  setup do
    @planificacion_requerimiento = planificaciones_requerimientos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:planificaciones_requerimientos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create planificacion_requerimiento" do
    assert_difference('PlanificacionRequerimiento.count') do
      post :create, planificacion_requerimiento: @planificacion_requerimiento.attributes
    end

    assert_redirected_to planificacion_requerimiento_path(assigns(:planificacion_requerimiento))
  end

  test "should show planificacion_requerimiento" do
    get :show, id: @planificacion_requerimiento.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @planificacion_requerimiento.to_param
    assert_response :success
  end

  test "should update planificacion_requerimiento" do
    put :update, id: @planificacion_requerimiento.to_param, planificacion_requerimiento: @planificacion_requerimiento.attributes
    assert_redirected_to planificacion_requerimiento_path(assigns(:planificacion_requerimiento))
  end

  test "should destroy planificacion_requerimiento" do
    assert_difference('PlanificacionRequerimiento.count', -1) do
      delete :destroy, id: @planificacion_requerimiento.to_param
    end

    assert_redirected_to planificaciones_requerimientos_path
  end
end
