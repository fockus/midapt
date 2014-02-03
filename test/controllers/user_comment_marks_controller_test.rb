require 'test_helper'

class UserCommentMarksControllerTest < ActionController::TestCase
  setup do
    @user_comment_mark = user_comment_marks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_comment_marks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_comment_mark" do
    assert_difference('UserCommentMark.count') do
      post :create, user_comment_mark: { mark: @user_comment_mark.mark }
    end

    assert_redirected_to user_comment_mark_path(assigns(:user_comment_mark))
  end

  test "should show user_comment_mark" do
    get :show, id: @user_comment_mark
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_comment_mark
    assert_response :success
  end

  test "should update user_comment_mark" do
    patch :update, id: @user_comment_mark, user_comment_mark: { mark: @user_comment_mark.mark }
    assert_redirected_to user_comment_mark_path(assigns(:user_comment_mark))
  end

  test "should destroy user_comment_mark" do
    assert_difference('UserCommentMark.count', -1) do
      delete :destroy, id: @user_comment_mark
    end

    assert_redirected_to user_comment_marks_path
  end
end
