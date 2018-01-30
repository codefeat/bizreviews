require 'test_helper'

class ProfileLinksControllerTest < ActionController::TestCase
  setup do
    @profile_link = profile_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profile_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile_link" do
    assert_difference('ProfileLink.count') do
      post :create, profile_link: { link_id: @profile_link.link_id, link_url: @profile_link.link_url, profile_review_id: @profile_link.profile_review_id, user_id: @profile_link.user_id }
    end

    assert_redirected_to profile_link_path(assigns(:profile_link))
  end

  test "should show profile_link" do
    get :show, id: @profile_link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile_link
    assert_response :success
  end

  test "should update profile_link" do
    patch :update, id: @profile_link, profile_link: { link_id: @profile_link.link_id, link_url: @profile_link.link_url, profile_review_id: @profile_link.profile_review_id, user_id: @profile_link.user_id }
    assert_redirected_to profile_link_path(assigns(:profile_link))
  end

  test "should destroy profile_link" do
    assert_difference('ProfileLink.count', -1) do
      delete :destroy, id: @profile_link
    end

    assert_redirected_to profile_links_path
  end
end
