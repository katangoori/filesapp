require 'test_helper'

class MydirectoriesControllerTest < ActionController::TestCase
  setup do
    @mydirectory = mydirectories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mydirectories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mydirectory" do
    assert_difference('Mydirectory.count') do
      post :create, mydirectory: { name: @mydirectory.name }
    end

    assert_redirected_to mydirectory_path(assigns(:mydirectory))
  end

  test "should show mydirectory" do
    get :show, id: @mydirectory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mydirectory
    assert_response :success
  end

  test "should update mydirectory" do
    patch :update, id: @mydirectory, mydirectory: { name: @mydirectory.name }
    assert_redirected_to mydirectory_path(assigns(:mydirectory))
  end

  test "should destroy mydirectory" do
    assert_difference('Mydirectory.count', -1) do
      delete :destroy, id: @mydirectory
    end

    assert_redirected_to mydirectories_path
  end
end
