class ProfileReviewsController < InheritedResources::Base

	def index
		@user = current_user

		@profile_review = ProfileReview.all
	end

	def edit
		@user = current_user
		@profile_review = ProfileReview.find(params[:id])
		@proView = ProfileReview.where(user: @user)
	end

	def show
		@user = current_user
		@profile_review = ProfileReview.find(params[:id])
		@proView = ProfileReview.where(user: @user)
	end
  private

    def profile_review_params
      params.require(:profile_review).permit(:user_id, :address1, :addresss2, :city, :state, :time_zone, :lat, :long, :gplace_id, :gcid, :gfid, :googleBiz_name, :fbBiz_name, :yelpBiz_name)
    end
end

