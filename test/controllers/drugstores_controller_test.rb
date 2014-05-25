require 'test_helper'

class DrugstoresControllerTest < ActionController::TestCase
  setup do
    @drugstore = drugstores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drugstores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create drugstore" do
    assert_difference('Drugstore.count') do
      post :create, drugstore: { Medicament_id: @drugstore.Medicament_id, address: @drugstore.address, description: @drugstore.description, name: @drugstore.name, phone: @drugstore.phone }
    end

    assert_redirected_to drugstore_path(assigns(:drugstore))
  end

  test "should show drugstore" do
    get :show, id: @drugstore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @drugstore
    assert_response :success
  end

  test "should update drugstore" do
    patch :update, id: @drugstore, drugstore: { Medicament_id: @drugstore.Medicament_id, address: @drugstore.address, description: @drugstore.description, name: @drugstore.name, phone: @drugstore.phone }
    assert_redirected_to drugstore_path(assigns(:drugstore))
  end

  test "should destroy drugstore" do
    assert_difference('Drugstore.count', -1) do
      delete :destroy, id: @drugstore
    end

    assert_redirected_to drugstores_path
  end
end
