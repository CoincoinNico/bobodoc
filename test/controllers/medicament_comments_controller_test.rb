require 'test_helper'

class MedicamentCommentsControllerTest < ActionController::TestCase
  setup do
    @medicament_comment = medicament_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medicament_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medicament_comment" do
    assert_difference('MedicamentComment.count') do
      post :create, medicament_comment: { references: @medicament_comment.references, review: @medicament_comment.review, title: @medicament_comment.title }
    end

    assert_redirected_to medicament_comment_path(assigns(:medicament_comment))
  end

  test "should show medicament_comment" do
    get :show, id: @medicament_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medicament_comment
    assert_response :success
  end

  test "should update medicament_comment" do
    patch :update, id: @medicament_comment, medicament_comment: { references: @medicament_comment.references, review: @medicament_comment.review, title: @medicament_comment.title }
    assert_redirected_to medicament_comment_path(assigns(:medicament_comment))
  end

  test "should destroy medicament_comment" do
    assert_difference('MedicamentComment.count', -1) do
      delete :destroy, id: @medicament_comment
    end

    assert_redirected_to medicament_comments_path
  end
end
