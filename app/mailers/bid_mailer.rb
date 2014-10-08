class BidMailer < ActionMailer::Base
	layout 'new_bid_mailer'

	default from: "SkillTra.de <jpholzmann@gmail.com>"
	
	
	def new_bid_mail(post) 

@email = :bid_user_email

#	@email = @post.user.email
	
		mail(
			to: @email,
			subject: "You got some help!"
		)
	end
end