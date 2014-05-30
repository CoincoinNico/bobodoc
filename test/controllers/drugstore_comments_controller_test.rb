require 'test_helper'

class DrugstoreCommentsControllerTest < ActionController::TestCase
  setup do
    @drugstore_comment = drugstore_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drugstore_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create drugstore_comment" do
    assert_difference('DrugstoreComment.count') do
      post :create, drugstore_comment: { review: @drugstore_comment.review, title: @drugstore_comment.title }
    end

    assert_redirected_to drugstore_comment_path(assigns(:drugstore_comment))
  end

  test "should show drugstore_comment" do
    get :show, id: @drugstore_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @drugstore_comment
    assert_response :success
  end

  test "should update drugstore_comment" do
    patch :update, id: @drugstore_comment, drugstore_comment: { review: @drugstore_comment.review, title: @drugstore_comment.title }
    assert_redirected_to drugstore_comment_path(assigns(:drugstore_comment))
  end

  test "should destroy drugstore_comment" do
    assert_difference('DrugstoreComment.count', -1) do
      delete :destroy, id: @drugstore_comment
    end

    assert_redirected_to drugstore_comments_path
  end
end
