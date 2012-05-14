require 'test_helper'

class SemanasControllerTest < ActionController::TestCase
  setup do
    @semana = semanas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:semanas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create semana" do
    assert_difference('Semana.count') do
      post :create, semana: @semana.attributes
    end

    assert_redirected_to semana_path(assigns(:semana))
  end

  test "should show semana" do
    get :show, id: @semana.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @semana.to_param
    assert_response :success
  end

  test "should update semana" do
    put :update, id: @semana.to_param, semana: @semana.attributes
    assert_redirected_to semana_path(assigns(:semana))
  end

  test "should destroy semana" do
    assert_difference('Semana.count', -1) do
      delete :destroy, id: @semana.to_param
    end

    assert_redirected_to semanas_path
  end
end
