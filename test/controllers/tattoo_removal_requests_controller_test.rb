require 'test_helper'

class TattooRemovalRequestsControllerTest < ActionController::TestCase
  setup do
    @tattoo_removal_request = tattoo_removal_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tattoo_removal_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tattoo_removal_request" do
    assert_difference('TattooRemovalRequest.count') do
      post :create, tattoo_removal_request: {  }
    end

    assert_redirected_to tattoo_removal_request_path(assigns(:tattoo_removal_request))
  end

  test "should show tattoo_removal_request" do
    get :show, id: @tattoo_removal_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tattoo_removal_request
    assert_response :success
  end

  test "should update tattoo_removal_request" do
    patch :update, id: @tattoo_removal_request, tattoo_removal_request: {  }
    assert_redirected_to tattoo_removal_request_path(assigns(:tattoo_removal_request))
  end

  test "should destroy tattoo_removal_request" do
    assert_difference('TattooRemovalRequest.count', -1) do
      delete :destroy, id: @tattoo_removal_request
    end

    assert_redirected_to tattoo_removal_requests_path
  end
end
