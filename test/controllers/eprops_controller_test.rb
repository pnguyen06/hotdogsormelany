require 'test_helper'

class EpropsControllerTest < ActionController::TestCase
  setup do
    @eprop = eprops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eprops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create eprop" do
    assert_difference('Eprop.count') do
      post :create, eprop: { oneeprop: @eprop.oneeprop, twoeprop: @eprop.twoeprop, zeroeprop: @eprop.zeroeprop }
    end

    assert_redirected_to eprop_path(assigns(:eprop))
  end

  test "should show eprop" do
    get :show, id: @eprop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @eprop
    assert_response :success
  end

  test "should update eprop" do
    patch :update, id: @eprop, eprop: { oneeprop: @eprop.oneeprop, twoeprop: @eprop.twoeprop, zeroeprop: @eprop.zeroeprop }
    assert_redirected_to eprop_path(assigns(:eprop))
  end

  test "should destroy eprop" do
    assert_difference('Eprop.count', -1) do
      delete :destroy, id: @eprop
    end

    assert_redirected_to eprops_path
  end
end
