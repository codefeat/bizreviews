class CompaniesController < ApplicationController
  def about
  end

  def contact
  end

  def new
  end

  def index
    @user = current_user
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
  end

def create
  # Amount in cents
  @amount = 8900

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end

end
