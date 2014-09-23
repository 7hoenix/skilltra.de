class Post < ActiveRecord::Base
	belongs_to :user
	has_one :job
	has_many :bids

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates :description, presence: true
end
