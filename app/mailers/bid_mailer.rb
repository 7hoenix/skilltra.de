class BidMailer < ActionMailer::Base
	layout 'new_bid_mailer'

	default from: "SkillTra.de <jpholzmann@gmail.com>"

	def new_bid_mail bid
		@bid = bid

		mail to: "phillip.matthew.phoenix@gmail.com", subject: "You got some help!"

	end
end