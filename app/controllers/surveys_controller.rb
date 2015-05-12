class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:edit, :new]


  def index
    @surveys = Survey.all
    @user = User.find(params[:user_id])
  end

  def create
    @survey = Survey.new(survey_params)
    @survey.page_count = 1
    @user = User.find(params[:user_id])

    if @survey.save

      redirect_to edit_user_survey_path(@user, @survey), notice: 'Thank you! You are amazing.'
    else
      render :new

    end
  end

  def update

    @user = User.find(params[:user_id])

    if @survey.update(survey_params)
       if @survey.page_count <= 7
         @survey.page_count += 1
         @survey.save

         redirect_to edit_user_survey_path(@user, @survey)
       else
         redirect_to users_path
       end
    else
      render :edit
    end
  end

  def edit
    @user = User.find_by_id(params[:user_id])
    @survey = Survey.find(params[:id])
  end


  def new
    @user = User.find(params[:user_id])
    @survey = Survey.new
    @survey.page_count = 1
  end

  def show
    @user = User.find(params[:user_id])

  end

  def destroy
    @survey.destroy
    redirect_to surveys_url, notice: 'Survey was successfully deleted.'
  end


  private

  def set_survey
    @survey = Survey.find(params[:id])
  end

  def survey_params
    params.require(:survey).permit(:reviewer_id, :reviewed_id, :testimonial, :skill_set, :months_of_experience, :projects_completed, :page_count, :user_id)
  end

end
