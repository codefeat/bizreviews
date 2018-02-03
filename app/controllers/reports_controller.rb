class ReportsController < ApplicationController

	def index
		@user = current_user
		@poor_review = PoorReview.new

		@profile_review = ProfileReview.new

		@feedbacks = PoorReview.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
		@bizprofile = ProfileReview.find(current_user.id)
		@count = @feedbacks.count
		@poor_review = PoorReview.new
    
	    @pReviews = ProfileReview.where(user_id: @user)
	    @thisUser = @user.city
	    @pReviews = ProfileReview.all
	    @pReview = ProfileReview.find_by_user_id(@user)
	    @majorlinks = Link.where(:link_cat => "major")
	    @somelinks = Link.where(:link_cat => "social media")
	    @dirlinks = Link.where(:link_cat => "directory")
	    @loclinks = Link.where(:link_cat => "local")
	    @pLinks = ProfileLink.all
	    @profileLinks = ProfileLink.where(user_id: @user)
	    @prolnks = ProfileLink.includes(:link).all
	    @newLinks = ProfileLink.joins(:link).where(:user_id => @user)
	    @count = @feedbacks.count if @user
	    @countResp = @feedbacks.responded.count if @user
	    @countResl = @feedbacks.resolved.count if @user
	    @countAtten = @feedbacks.attention.count if @user
	end
	
end
