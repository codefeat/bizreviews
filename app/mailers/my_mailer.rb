class MyMailer < Devise::Mailer   
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views
  default from: "lowellfortune@gmail.com"

	def confirmation_instructions(record, token, opts={})
	  headers["Custom-header"] = "NextPakk Delivery"
	  opts[:from] = 'delivery@nextpakk.com'
	  opts[:reply_to] = 'delivery@nextpakk.com'
	  super
	end

	def purchase_receipt(purchase)
		render layout: 'purchase_mailer'
	    #@from = "delivery@gonextpakk.com"
		#@user = current_user
		@purchase = purchase
		mail(:to => "#{@user_fname} <#{@user_email}>", from: "delivery@nextpakk.com", subject: "Thank you for using NextPakk.")
	end

	def new_purchase(purchase)
	  	#@user = current_user
	    @purchase = purchase
	    @plan = @purchase.plan
	    mail(:to => "#{purchase.email}", from: "delivery@nextpakk.com", subject: "Thank you for using NextPakk.")
  	end

  	def new_invite(invite)
  		#render layout: 'invite_mailer'
  		@invite = invite
  		mail(:to => "#{@invite.email}>", from: "lowellfortune@gmail.com", subject: "Follow Up!")
  	end

  	def new_poor_review(poor_review)

  		@poor_review = poor_review
  		
  		@thisUser = User.find(@poor_review.user_id)
  		
  		@userEmail =@thisUser.email
  		mail(:to => "#{@userEmail}>", from: "#{@poor_review.email}", subject: "Poor Review")
  	end



end