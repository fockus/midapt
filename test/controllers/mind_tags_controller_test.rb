require 'test_helper'

class MindTagsControllerTest < ActionController::TestCase
  setup do
    @mind_tag = mind_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mind_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mind_tag" do
    assert_difference('MindTag.count') do
      post :create, mind_tag: {  }
    end

    assert_redirected_to mind_tag_path(assigns(:mind_tag))
  end

  test "should show mind_tag" do
    get :show, id: @mind_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mind_tag
    assert_response :success
  end

  test "should update mind_tag" do
    patch :update, id: @mind_tag, mind_tag: {  }
    assert_redirected_to mind_tag_path(assigns(:mind_tag))
  end

  test "should destroy mind_tag" do
    assert_difference('MindTag.count', -1) do
      delete :destroy, id: @mind_tag
    end

    assert_redirected_to mind_tags_path
  end
end
