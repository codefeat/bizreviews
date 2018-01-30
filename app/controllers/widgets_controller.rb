class WidgetsController < ApplicationController

	def index
		@user = current_user
		@widgetUser = User.find(@user.id)

		@feedbacks = PoorReview.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')

		@count = @feedbacks.count
	end

end