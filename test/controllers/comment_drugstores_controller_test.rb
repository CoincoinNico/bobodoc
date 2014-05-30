require 'test_helper'

class CommentDrugstoresControllerTest < ActionController::TestCase
  setup do
    @comment_drugstore = comment_drugstores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comment_drugstores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment_drugstore" do
    assert_difference('CommentDrugstore.count') do
      post :create, comment_drugstore: { review: @comment_drugstore.review, title: @comment_drugstore.title }
    end

    assert_redirected_to comment_drugstore_path(assigns(:comment_drugstore))
  end

  test "should show comment_drugstore" do
    get :show, id: @comment_drugstore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment_drugstore
    assert_response :success
  end

  test "should update comment_drugstore" do
    patch :update, id: @comment_drugstore, comment_drugstore: { review: @comment_drugstore.review, title: @comment_drugstore.title }
    assert_redirected_to comment_drugstore_path(assigns(:comment_drugstore))
  end

  test "should destroy comment_drugstore" do
    assert_difference('CommentDrugstore.count', -1) do
      delete :destroy, id: @comment_drugstore
    end

    assert_redirected_to comment_drugstores_path
  end
end
