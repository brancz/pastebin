require 'test_helper'

class PastesControllerTest < ActionController::TestCase
  setup do
    @paste = pastes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pastes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paste" do
    assert_difference('Paste.count') do
      post :create, paste: { content: @paste.content, title: @paste.title }
    end

    assert_redirected_to paste_path(assigns(:paste))
  end

  test "should show paste" do
    get :show, id: @paste
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @paste
    assert_response :success
  end

  test "should update paste" do
    patch :update, id: @paste, paste: { content: @paste.content, title: @paste.title }
    assert_redirected_to paste_path(assigns(:paste))
  end

  test "should destroy paste" do
    assert_difference('Paste.count', -1) do
      delete :destroy, id: @paste
    end

    assert_redirected_to pastes_path
  end
end
