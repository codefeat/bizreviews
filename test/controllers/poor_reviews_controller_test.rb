require 'test_helper'

class PoorReviewsControllerTest < ActionController::TestCase
  setup do
    @poor_review = poor_reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:poor_reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create poor_review" do
    assert_difference('PoorReview.count') do
      post :create, poor_review: { email: @poor_review.email, feedback_action: @poor_review.feedback_action, first_name: @poor_review.first_name, invite_id: @poor_review.invite_id, ip_address: @poor_review.ip_address, last_name: @poor_review.last_name, message: @poor_review.message, note: @poor_review.note, phone: @poor_review.phone, status: @poor_review.status, user_id: @poor_review.user_id }
    end

    assert_redirected_to poor_review_path(assigns(:poor_review))
  end

  test "should show poor_review" do
    get :show, id: @poor_review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @poor_review
    assert_response :success
  end

  test "should update poor_review" do
    patch :update, id: @poor_review, poor_review: { email: @poor_review.email, feedback_action: @poor_review.feedback_action, first_name: @poor_review.first_name, invite_id: @poor_review.invite_id, ip_address: @poor_review.ip_address, last_name: @poor_review.last_name, message: @poor_review.message, note: @poor_review.note, phone: @poor_review.phone, status: @poor_review.status, user_id: @poor_review.user_id }
    assert_redirected_to poor_review_path(assigns(:poor_review))
  end

  test "should destroy poor_review" do
    assert_difference('PoorReview.count', -1) do
      delete :destroy, id: @poor_review
    end

    assert_redirected_to poor_reviews_path
  end
end
