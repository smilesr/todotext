require 'test_helper'

class TasksControllerTest < ActionController::TestCase

  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: @user
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should get update" do
    get :update, id:@user
    assert_response :success
  end

  test "should get destroy" do
    get :destroy, id: @user
    assert_response :success
  end

end
