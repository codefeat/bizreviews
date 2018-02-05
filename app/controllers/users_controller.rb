class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, except: [:index, :show, :page]

  def new
    @lastSubs = Subscription.all
      @lastSub = Subscription.last
      @lastSubId = @lastSub.id
  end

  def edit
    @user = current_user
  end

  def profile
    @user = User.find_by_business_name(params[:business_name])
  end

  def page

    @user = current_user
    #@deliveries = Delivery.all
    #@orders = Order.all
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

  def update_password
    @user = current_user
      if @user.update(user_params)
        bypass_sign_in(@user)
        redirect_to root_path
      else
        render "edit"
      end
    end

  def index
    @user = current_user
    #@deliveries = Delivery.all
    #@orders = Order.all
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
    @bizprofile = ProfileReview.find(@user) if @user
    @thisUser = @user.city if @user
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

  def show
  	@user = current_user
  	#@subscriptions = Subscription.all
  	#@subscription = current_user.subscriptions
  	#@plans = Plan.all
    #@promos = Promo.all
    @pReviews = ProfileReview.all
    @pReview = ProfileReview.find_by_user_id(@user)
    
  end

  def create
      @user = User.new(user_params)
      @thisUser = current_user
      #@lastSubs = Subscription.all
      @lastUser = User.last
      @thisBiz = @lastUser.business_name
      #promo_code = params[:promo_code]
      #@promos = Promo.where("promo_code = ?", promo_code) 
      respond_to do |format|   
      if @user.save
          #UserMailer.registration_confirmation(@user).deliver_now
          #ProfileReview.create!(:user_id => @thisUser, :googleBiz_name => @thisUser.business_name)
          format.html {redirect_to root_url, notice: "Please confirm your email address to continue"}
          format.html { redirect_to url_for(:controller => 'subscriptions', :action => 'pay', :id => params[:schedule][:subscription_id], :did => params[:schedule][:delivery_id], :oid => params[:schedule][:orderNum])  }

          #flash[:success] = "Please confirm your email address to continue"
          #AdminMailer.new_user(@user).deliver_now
          #redirect_to root_url
        else
          format.html { render :new }
          format.json { render json: @user.erros, status: :unprocessable_entity }
          #flash[:error] = "Ooooppss, something went wrong!"
          #render 'new'
        end
      end

  end

  def invite_user
    @user = User.invite!(:email => params[:user][:email], :name => params[:user][:first_name])
    render :json => @user
  end

  #private
    #def pwd_params
      #params.require(:user).permit(:password, :password_confirmation)
    #end
  
end