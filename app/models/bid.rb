class Bid < ActiveRecord::Base
	after_create :email_poster_bid

	belongs_to :post
	has_one :user

	private 

		def email_poster_bid
			BidMailer.new_bid_mail(post).deliver
		end

end