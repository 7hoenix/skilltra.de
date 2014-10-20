class Review < ActiveRecord::Base
  belongs_to :job
  has_one :user

  # def set_average
  #   id = params[:id]
  #
  #
  #   @user = User.find(:reviewed_user)
  #   @user.average_score = (@user.average_score + score) / jobs.number
  # end
end