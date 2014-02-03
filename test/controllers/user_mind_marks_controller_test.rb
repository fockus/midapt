require 'test_helper'

class UserMindMarksControllerTest < ActionController::TestCase
  setup do
    @user_mind_mark = user_mind_marks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_mind_marks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_mind_mark" do
    assert_difference('UserMindMark.count') do
      post :create, user_mind_mark: { mark: @user_mind_mark.mark }
    end

    assert_redirected_to user_mind_mark_path(assigns(:user_mind_mark))
  end

  test "should show user_mind_mark" do
    get :show, id: @user_mind_mark
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_mind_mark
    assert_response :success
  end

  test "should update user_mind_mark" do
    patch :update, id: @user_mind_mark, user_mind_mark: { mark: @user_mind_mark.mark }
    assert_redirected_to user_mind_mark_path(assigns(:user_mind_mark))
  end

  test "should destroy user_mind_mark" do
    assert_difference('UserMindMark.count', -1) do
      delete :destroy, id: @user_mind_mark
    end

    assert_redirected_to user_mind_marks_path
  end
end
