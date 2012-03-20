require 'test_helper'

class AreasUsuariosControllerTest < ActionController::TestCase
  setup do
    @area_usuario = areas_usuarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:areas_usuarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create area_usuario" do
    assert_difference('AreaUsuario.count') do
      post :create, area_usuario: @area_usuario.attributes
    end

    assert_redirected_to area_usuario_path(assigns(:area_usuario))
  end

  test "should show area_usuario" do
    get :show, id: @area_usuario.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @area_usuario.to_param
    assert_response :success
  end

  test "should update area_usuario" do
    put :update, id: @area_usuario.to_param, area_usuario: @area_usuario.attributes
    assert_redirected_to area_usuario_path(assigns(:area_usuario))
  end

  test "should destroy area_usuario" do
    assert_difference('AreaUsuario.count', -1) do
      delete :destroy, id: @area_usuario.to_param
    end

    assert_redirected_to areas_usuarios_path
  end
end
