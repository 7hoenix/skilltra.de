class ViralLoopController < ApplicationController
  before_action :authenticate_user!


  def index
    @testimonials = Survey.all
  end

  def create
    @testimonial = Survey.new(testimonial_params)


    if @testimonial.save

      redirect_to posts_path, notice: 'Thank you! You are amazing.'
    else
      render :new

    end
  end


  def new
    @testimonial = Survey.new
    @account = Account.find(params[:account_id])

  end

  def show
    @testimonial = Survey.find(params[:id])

  end


  private

  def testimonial_params
    params.require(:testimonial).permit(:reviewer_id, :reviewed_id, :testimonial)
  end



end
