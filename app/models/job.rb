class Job < ActiveRecord::Base
	belongs_to :user
	has_one :post
  has_one :review



end