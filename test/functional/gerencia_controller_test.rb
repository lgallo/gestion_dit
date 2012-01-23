require 'test_helper'

class GerenciaControllerTest < ActionController::TestCase
  setup do
    @gerencium = gerencia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gerencia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gerencium" do
    assert_difference('Gerencium.count') do
      post :create, gerencium: @gerencium.attributes
    end

    assert_redirected_to gerencium_path(assigns(:gerencium))
  end

  test "should show gerencium" do
    get :show, id: @gerencium.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gerencium.to_param
    assert_response :success
  end

  test "should update gerencium" do
    put :update, id: @gerencium.to_param, gerencium: @gerencium.attributes
    assert_redirected_to gerencium_path(assigns(:gerencium))
  end

  test "should destroy gerencium" do
    assert_difference('Gerencium.count', -1) do
      delete :destroy, id: @gerencium.to_param
    end

    assert_redirected_to gerencia_path
  end
end
