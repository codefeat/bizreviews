class ProfileLinksController < InheritedResources::Base
def new
	@profile_link = ProfileLink.new
	@profile_links = ProfileLink.all
	@links = Link.all
	@user = current_user
end

def create
	  @user = current_user
	  @profile_links = ProfileLink.new(profile_link_params)
	  respond_to do |format|
	    if @profile_links.save
	      format.html { redirect_to root_path, notice: 'profile link was successfully created.' }
	    else
	      format.html { render action: "new" }
	    end
	  end
	end

	def destroy
	  @profile_link = ProfileLink.find(params[:id])
	  @profile_link.destroy

	  respond_to do |format|
	  format.html { redirect_to root_path, notice: 'profile link was successfully deleted.' }
	  format.json  { head :no_content }
	  end
	end
  
  private

    def profile_link_params
      params.require(:profile_link).permit(:user_id, :profile_review_id, :link_id, :link_url)
    end
end

