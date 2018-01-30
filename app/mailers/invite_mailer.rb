class InviteMailer < ApplicationMailer

	def new_invite(invite)
		@invite = Invite.last

		mail(:to => "#{invite.email}", subject: "Follow Up Now!")
	end


end