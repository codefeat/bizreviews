class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  respond_to :html, :json

  protect_from_forgery with: :exception

  #protect_from_forgery 


  before_action :configure_permitted_parameters, if: :devise_controller?
 
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:business_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:business_phone])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:business_zipcode])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:business_url])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:city])
    devise_parameter_sanitizer.permit(:account_update, keys: [:business_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:business_phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:business_zipcode])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:business_url])

    devise_parameter_sanitizer.permit(:sign_up, keys: [:image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:image])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:rsos_num]) 
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:email]) 
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name]) 
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:last_name]) 
  end

  def create_profile_review
  		@lastUser = User.last
  		@thisBiz = @lastUser.business_name
  		@revBiz	= @thisBiz.parameterize('-').downcase
  		@fbBiz = @thisBiz.gsub(' ', '').downcase
      ProfileReview.create(:user_id => current_user.id, :googleBiz_name => @revBiz, :fbBiz_name => @fbBiz, :yelpBiz_name => @revBiz, :gplace_id => 'add info', :gcid => 'add info', :gfid => 'add info')
  end

  def after_update_path
    redirect_to root_path
  end

   def after_sign_in_path_for(resource_or_scope)
      if resource_or_scope.is_a?(User)
        root_path
      elsif resource_or_scope.is_a?(AdminUser) 
        admin_dashboard_path(resource_or_scope)
      end
    end

  #def respond_modal_with(*args, &blk)
    #options = args.extract_options!
    #options[:responder] = ModalResponder
    #respond_with *args, options, &blk
  #end

  def get_invite_index
    format.html { redirect_to invites_url, notice: 'Invite status was successfully created.' }
        format.json { render :show, status: :created, location: @invite }
  end


end
