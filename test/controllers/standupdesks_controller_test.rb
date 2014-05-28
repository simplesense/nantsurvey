require 'test_helper'

class StandupdesksControllerTest < ActionController::TestCase
  setup do
    @standupdesk = standupdesks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:standupdesks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create standupdesk" do
    assert_difference('Standupdesk.count') do
      post :create, standupdesk: { desklocation: @standupdesk.desklocation, deskwant: @standupdesk.deskwant }
    end

    assert_redirected_to standupdesk_path(assigns(:standupdesk))
  end

  test "should show standupdesk" do
    get :show, id: @standupdesk
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @standupdesk
    assert_response :success
  end

  test "should update standupdesk" do
    patch :update, id: @standupdesk, standupdesk: { desklocation: @standupdesk.desklocation, deskwant: @standupdesk.deskwant }
    assert_redirected_to standupdesk_path(assigns(:standupdesk))
  end

  test "should destroy standupdesk" do
    assert_difference('Standupdesk.count', -1) do
      delete :destroy, id: @standupdesk
    end

    assert_redirected_to standupdesks_path
  end
end
