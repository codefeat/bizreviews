class PoorReviewsController < InheritedResources::Base


  def create
	  @user = current_user
	  @poor_review = PoorReview.new(poor_review_params)
	  respond_to do |format|
	    if @poor_review.save
	      format.html { redirect_to root_path, notice: 'poor review was successfully sent.' }
	    else
	      format.html { render action: "new" }
	    end
	  end
	end

  private

    def poor_review_params
      params.require(:poor_review).permit(:user_id, :invite_id, :first_name, :last_name, :email, :phone, :message, :ip_address, :feedback_action, :status, :note)
    end
end

