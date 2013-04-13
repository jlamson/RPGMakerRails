require 'test_helper'

class SystemsControllerTest < ActionController::TestCase
  setup do
    @system = systems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:systems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create system" do
    assert_difference('System.count') do
      post :create, system: { description: @system.description, name: @system.name, parent_id: @system.parent_id, public: @system.public, user_id: @system.user_id }
    end

    assert_redirected_to system_path(assigns(:system))
  end

  test "should show system" do
    get :show, id: @system
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @system
    assert_response :success
  end

  test "should update system" do
    put :update, id: @system, system: { description: @system.description, name: @system.name, parent_id: @system.parent_id, public: @system.public, user_id: @system.user_id }
    assert_redirected_to system_path(assigns(:system))
  end

  test "should destroy system" do
    assert_difference('System.count', -1) do
      delete :destroy, id: @system
    end

    assert_redirected_to systems_path
  end
end
