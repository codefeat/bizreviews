class WidgetsController < ApplicationController

	def index
		@user = current_user
		@widgetUser = User.find(@user.id)

	    @poor_review = PoorReview.new
	    @poor_reviews = PoorReview.all
	    @profile_review = ProfileReview.new
	    #@products = Product.all
	    #@order = @user.orders.all.reverse if @user
	    #@subscriptions = Subscription.where(user_id: @user)
	    #@delivery = current_user.deliveries.find(params[:order_id])
	    #@order = current_user.orders.find(params[:id])
	    #@schedules = Schedule.all
	    @pReviews = ProfileReview.where(user_id: @user)
	    @bizprofile = ProfileReview.find(current_user.id)
	    @thisUser = @user.city
	    #@delivery = Delivery.where(order_id: @order)
	    @pReviews = ProfileReview.all
	    @pReview = ProfileReview.find_by_user_id(@user)
	    @majorlinks = Link.where(:link_cat => "major")
	    @somelinks = Link.where(:link_cat => "social media")
	    @dirlinks = Link.where(:link_cat => "directory")
	    @loclinks = Link.where(:link_cat => "local")
	    @pLinks = ProfileLink.all
	    @profileLinks = ProfileLink.where(user_id: @user)
	    #@product = Order.where(product_id: @order.products.id)
	    #@delivery = Delivery.find(params[:order_id])
	    @prolnks = ProfileLink.includes(:link).all
	    @newLinks = ProfileLink.joins(:link).where(:user_id => @user)
	    #@mylinks = profile_links.links 
	    @feedbacks = PoorReview.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 5).order('created_at DESC') if @user
	    @count = @feedbacks.count if @user
	    @invites = Invite.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 5).order('created_at DESC') if @user
	    @incount = @invites.count if @user
	end

end