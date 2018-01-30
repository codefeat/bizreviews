class BusinessesController < ApplicationController

	def index
		@user = current_user
		@poor_review = PoorReview.new

		@feedbacks = PoorReview.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')

		@count = @feedbacks.count
	end
end
