class AccountSkill < ActiveRecord::Base
  belongs_to :account
  belongs_to :skill
end
