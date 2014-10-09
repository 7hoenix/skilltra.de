class BidMailer < ActionMailer::Base
	layout 'new_bid_mailer'

	default from: "SkillTra.de <jpholzmann@gmail.com>"
	
	
	def new_bid_mail(post)
#@post = post

#@email = @post.user.email
#:bid_user_email

#	@email = @post.user.email

$post_user_id = post.user_id
$post_AR = User.find($post_user_id)
$post_AR.email

	
		mail to: $post_AR.email, subject: "Help is on the Way"
	end
end