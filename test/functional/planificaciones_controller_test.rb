require 'test_helper'

class PlanificacionesControllerTest < ActionController::TestCase
  setup do
    @planificacion = planificaciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:planificaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create planificacion" do
    assert_difference('Planificacion.count') do
      post :create, planificacion: @planificacion.attributes
    end

    assert_redirected_to planificacion_path(assigns(:planificacion))
  end

  test "should show planificacion" do
    get :show, id: @planificacion.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @planificacion.to_param
    assert_response :success
  end

  test "should update planificacion" do
    put :update, id: @planificacion.to_param, planificacion: @planificacion.attributes
    assert_redirected_to planificacion_path(assigns(:planificacion))
  end

  test "should destroy planificacion" do
    assert_difference('Planificacion.count', -1) do
      delete :destroy, id: @planificacion.to_param
    end

    assert_redirected_to planificaciones_path
  end
end
