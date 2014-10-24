class ReviewsController < ApplicationController
  # after_action :project_completed, only: [:create]
  # before_action :set_review, only: [:my_reviews]


  def index
    @reviews = Review.all
    @job = Job.find(params[:job_id])
  end

  def create
    @review = Review.new(review_params)
    @job = Job.find_by_id(review_params[:job_id])
    @user = User.find_by_id(review_params[:reviewee_id])

      if @review.save
        # @review.set_average
        @job.completed = true
        @job.save
        @user.jobs_completed += 1

        @user.average_score = Review.where(reviewee_id: current_user.id).pluck(:score).sum / Review.where(reviewee_id: current_user.id).pluck(:score).count
        @user.save

        redirect_to posts_path, notice: 'Thank you! You are amazing.'
      else
        render :new

      end
  end



  def new
    @review = Review.new
    @job = Job.find(params[:job_id])

  end

  def show
    @review = Review.find(params[:id])

  end


  def my_reviews
    @reviews = Review.all
    @job = Job.all
    @user = User.all
    @account = Account.all
  end

  def people_reviewed
    @reviews = Review.all
    @job = Job.all
    @user = User.all
    @account = Account.all
  end


  private

  # def project_completed
  #   update_attribute(:completed, true)
  # end

  # def set_review
  #   @review = Review.find(params[:id])
  # end


  def review_params
    params.require(:review).permit(:score, :user_id, :job_id, :reviewee_id, :reviewer_id)
  end



end