class InvitesController < InheritedResources::Base
  before_action :authenticate_user!
  #before_filter :authenticate!, except: [:provider, :provide_update]


  #after_action :get_invite_index

    def index
    	@user = current_user
    	@users = User.all
    	@thisUser = User.find(@user)
    	@invites = Invite.where(:user_id => @user).paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
    	@thisBiz = User.joins(:invite).where(:user_id => current_user.id)
    	@feedbacks = PoorReview.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
		@count = @feedbacks.count
    end

	def new
    	@invite = Invite.new
    end

	def create
	  @user = current_user
	  @invite = Invite.new(invite_params)
	  @thisUser = Invite.where(:user_id => @user)
	  respond_to do |format|
	    if @invite.save
	    	@invite.send_invite
	      format.html { redirect_to invites_path, notice: 'invite was successfully created.' }
	    else
	      format.html { render action: "new" }
	    end
	  end
	end
	def provider
		@invite = Invite.find_by token: params[:token]
	end
  private

    def invite_params
      params.require(:invite).permit(:fname, :lname, :email, :user_group_id, :user_id, :recipient_id, :token)
    end


	#def new
		#@invite = Invite.new
	#end

	#def edit
		#@invite = Invite.find(params[:id])
	#end
end

