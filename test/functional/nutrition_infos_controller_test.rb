require 'test_helper'

class NutritionInfosControllerTest < ActionController::TestCase
  setup do
    @nutrition_info = nutrition_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nutrition_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nutrition_info" do
    assert_difference('NutritionInfo.count') do
      post :create, nutrition_info: { calories: @nutrition_info.calories, carbohydates: @nutrition_info.carbohydates, fat: @nutrition_info.fat, fiber: @nutrition_info.fiber, protein: @nutrition_info.protein, recipe_id: @nutrition_info.recipe_id }
    end

    assert_redirected_to nutrition_info_path(assigns(:nutrition_info))
  end

  test "should show nutrition_info" do
    get :show, id: @nutrition_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nutrition_info
    assert_response :success
  end

  test "should update nutrition_info" do
    put :update, id: @nutrition_info, nutrition_info: { calories: @nutrition_info.calories, carbohydates: @nutrition_info.carbohydates, fat: @nutrition_info.fat, fiber: @nutrition_info.fiber, protein: @nutrition_info.protein, recipe_id: @nutrition_info.recipe_id }
    assert_redirected_to nutrition_info_path(assigns(:nutrition_info))
  end

  test "should destroy nutrition_info" do
    assert_difference('NutritionInfo.count', -1) do
      delete :destroy, id: @nutrition_info
    end

    assert_redirected_to nutrition_infos_path
  end
end
