class PoorReview < ActiveRecord::Base
	after_create :send_poor_review

	belongs_to :user
	enum status: [:attention, :responded, :resolved]
	def send_poor_review
		MyMailer.new_poor_review(self).deliver_now
		#MyMailer.new_invite(self).deliver_later!(wait_until: 5.minutes.from_now)
	end
end
