require 'test_helper'

class WhenoptionsControllerTest < ActionController::TestCase
  setup do
    @whenoption = whenoptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:whenoptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create whenoption" do
    assert_difference('Whenoption.count') do
      post :create, whenoption: { content: @whenoption.content, event_id: @whenoption.event_id }
    end

    assert_redirected_to whenoption_path(assigns(:whenoption))
  end

  test "should show whenoption" do
    get :show, id: @whenoption
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @whenoption
    assert_response :success
  end

  test "should update whenoption" do
    patch :update, id: @whenoption, whenoption: { content: @whenoption.content, event_id: @whenoption.event_id }
    assert_redirected_to whenoption_path(assigns(:whenoption))
  end

  test "should destroy whenoption" do
    assert_difference('Whenoption.count', -1) do
      delete :destroy, id: @whenoption
    end

    assert_redirected_to whenoptions_path
  end
end
