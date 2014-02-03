require 'test_helper'

class UserMindTagMarksControllerTest < ActionController::TestCase
  setup do
    @user_mind_tag_mark = user_mind_tag_marks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_mind_tag_marks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_mind_tag_mark" do
    assert_difference('UserMindTagMark.count') do
      post :create, user_mind_tag_mark: { mark: @user_mind_tag_mark.mark }
    end

    assert_redirected_to user_mind_tag_mark_path(assigns(:user_mind_tag_mark))
  end

  test "should show user_mind_tag_mark" do
    get :show, id: @user_mind_tag_mark
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_mind_tag_mark
    assert_response :success
  end

  test "should update user_mind_tag_mark" do
    patch :update, id: @user_mind_tag_mark, user_mind_tag_mark: { mark: @user_mind_tag_mark.mark }
    assert_redirected_to user_mind_tag_mark_path(assigns(:user_mind_tag_mark))
  end

  test "should destroy user_mind_tag_mark" do
    assert_difference('UserMindTagMark.count', -1) do
      delete :destroy, id: @user_mind_tag_mark
    end

    assert_redirected_to user_mind_tag_marks_path
  end
end
