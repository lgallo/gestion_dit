require 'test_helper'

class RequerimientosAreasControllerTest < ActionController::TestCase
  setup do
    @requerimiento_area = requerimientos_areas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requerimientos_areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create requerimiento_area" do
    assert_difference('RequerimientoArea.count') do
      post :create, requerimiento_area: @requerimiento_area.attributes
    end

    assert_redirected_to requerimiento_area_path(assigns(:requerimiento_area))
  end

  test "should show requerimiento_area" do
    get :show, id: @requerimiento_area.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @requerimiento_area.to_param
    assert_response :success
  end

  test "should update requerimiento_area" do
    put :update, id: @requerimiento_area.to_param, requerimiento_area: @requerimiento_area.attributes
    assert_redirected_to requerimiento_area_path(assigns(:requerimiento_area))
  end

  test "should destroy requerimiento_area" do
    assert_difference('RequerimientoArea.count', -1) do
      delete :destroy, id: @requerimiento_area.to_param
    end

    assert_redirected_to requerimientos_areas_path
  end
end
