class Credit < ActiveRecord::Base
	before_create :default_values
	belongs_to :user
end