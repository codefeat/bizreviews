require 'test_helper'

class ProfileReviewsControllerTest < ActionController::TestCase
  setup do
    @profile_review = profile_reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profile_reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile_review" do
    assert_difference('ProfileReview.count') do
      post :create, profile_review: { address1: @profile_review.address1, address2: @profile_review.address2, city: @profile_review.city, gcid: @profile_review.gcid, gfid: @profile_review.gfid, gplace_id: @profile_review.gplace_id, long: @profile_review.long, state: @profile_review.state, time_zone: @profile_review.time_zone, user_id: @profile_review.user_id }
    end

    assert_redirected_to profile_review_path(assigns(:profile_review))
  end

  test "should show profile_review" do
    get :show, id: @profile_review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile_review
    assert_response :success
  end

  test "should update profile_review" do
    patch :update, id: @profile_review, profile_review: { address1: @profile_review.address1, address2: @profile_review.address2, city: @profile_review.city, gcid: @profile_review.gcid, gfid: @profile_review.gfid, gplace_id: @profile_review.gplace_id, long: @profile_review.long, state: @profile_review.state, time_zone: @profile_review.time_zone, user_id: @profile_review.user_id }
    assert_redirected_to profile_review_path(assigns(:profile_review))
  end

  test "should destroy profile_review" do
    assert_difference('ProfileReview.count', -1) do
      delete :destroy, id: @profile_review
    end

    assert_redirected_to profile_reviews_path
  end
end
