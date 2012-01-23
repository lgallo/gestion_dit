require 'test_helper'

class AplicacionesControllerTest < ActionController::TestCase
  setup do
    @aplicacion = aplicaciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aplicaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aplicacion" do
    assert_difference('Aplicacion.count') do
      post :create, aplicacion: @aplicacion.attributes
    end

    assert_redirected_to aplicacion_path(assigns(:aplicacion))
  end

  test "should show aplicacion" do
    get :show, id: @aplicacion.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aplicacion.to_param
    assert_response :success
  end

  test "should update aplicacion" do
    put :update, id: @aplicacion.to_param, aplicacion: @aplicacion.attributes
    assert_redirected_to aplicacion_path(assigns(:aplicacion))
  end

  test "should destroy aplicacion" do
    assert_difference('Aplicacion.count', -1) do
      delete :destroy, id: @aplicacion.to_param
    end

    assert_redirected_to aplicaciones_path
  end
end
