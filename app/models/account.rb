class Account < ActiveRecord::Base
	belongs_to :user

	has_many :skills, through: :account_skills
	has_many :account_skills
	accepts_nested_attributes_for :account_skills
	accepts_nested_attributes_for :skills

	has_many :surveys

end
