require 'test_helper'

class MindsControllerTest < ActionController::TestCase
  setup do
    @mind = minds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:minds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mind" do
    assert_difference('Mind.count') do
      post :create, mind: { text: @mind.text, title: @mind.title, user_id: @mind.user_id }
    end

    assert_redirected_to mind_path(assigns(:mind))
  end

  test "should show mind" do
    get :show, id: @mind
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mind
    assert_response :success
  end

  test "should update mind" do
    patch :update, id: @mind, mind: { text: @mind.text, title: @mind.title, user_id: @mind.user_id }
    assert_redirected_to mind_path(assigns(:mind))
  end

  test "should destroy mind" do
    assert_difference('Mind.count', -1) do
      delete :destroy, id: @mind
    end

    assert_redirected_to minds_path
  end
end
