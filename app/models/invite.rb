class Invite < ActiveRecord::Base
	before_create :add_token
	after_create :send_invite

	belongs_to :user

	#belongs_to :user_group

	#belongs_to :sender, :class_name => 'User'

	#belongs_to :recipient, :class_name => 'User'

	def send_invite
		MyMailer.new_invite(self).deliver_now
		#MyMailer.new_invite(self).deliver_later!(wait_until: 5.minutes.from_now)
	end

	def provider
		@invite = Invite.find_by token: params[:token]
	end

	private
	def add_token
		begin
			self.token = SecureRandom.hex[0,10].upcase
		end while self.class.exists?(token: token)
	end
end