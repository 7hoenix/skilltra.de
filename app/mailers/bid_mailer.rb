class BidMailer < ActionMailer::Base
	layout 'new_bid_mailer'

	default from: "SkillTra.de <jpholzmann@gmail.com>"
	
	
	def new_bid_mail(post)
#@post = post

#@email = @post.user.email
#:bid_user_email

#	@email = @post.user.email

$bid_user_id = post.user_id
$bid_AR = User.find($bid_user_id)
$bid_AR.email

	
		mail to: $bid_AR.email, subject: "Help is on the Way"
	end
end