require 'test_helper'

class PlanificacionesSemanalesControllerTest < ActionController::TestCase
  setup do
    @planificacion_semanal = planificaciones_semanales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:planificaciones_semanales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create planificacion_semanal" do
    assert_difference('PlanificacionSemanal.count') do
      post :create, planificacion_semanal: @planificacion_semanal.attributes
    end

    assert_redirected_to planificacion_semanal_path(assigns(:planificacion_semanal))
  end

  test "should show planificacion_semanal" do
    get :show, id: @planificacion_semanal.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @planificacion_semanal.to_param
    assert_response :success
  end

  test "should update planificacion_semanal" do
    put :update, id: @planificacion_semanal.to_param, planificacion_semanal: @planificacion_semanal.attributes
    assert_redirected_to planificacion_semanal_path(assigns(:planificacion_semanal))
  end

  test "should destroy planificacion_semanal" do
    assert_difference('PlanificacionSemanal.count', -1) do
      delete :destroy, id: @planificacion_semanal.to_param
    end

    assert_redirected_to planificaciones_semanales_path
  end
end
