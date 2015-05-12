 class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy, :update, :start_over]
  before_action :set_viral_users, only: [:edit, :update]

  def verified_back
    @user.verified -= 1
    @user.save
    redirect_to edit_user_path(@user)
  end

  def index
    @users = User.all.order("created_at DESC").paginate(:per_page => 22, :page => params[:page])
  end

  def admin_users
    @users = User.all
  end


  def show
    @user = User.find(params[:id])
  end

  def new

  end

  def edit

    @user = User.find(params[:id])
    @survey = Survey.new
    @skills = Skill.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new, notice: 'User was successfully created.'
    end
  end

  def update
    @user = User.find(params[:id])
    @survey = Survey.new

    if @user.update(user_params)

      if @user.verified <= 10
        @user.verified += 1
        @user.save
        redirect_to edit_user_path(@user)
      else
        redirect_to @user, notice: 'Thank you for updating your user. Keep being awesome.'
      end
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  def admin_edit

    @user = User.all
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def set_viral_users
    @reviewed_user = User.find_by(id: 1)
    @reviewer_user = User.find_by(id: 2)
  end


  def user_params
    params.require(:user).permit(:bio, :primarySkill, :secondarySkill, :company, :completed, :avatar, :skill_set, :months_of_experience, :projects_completed, :same_skill_names, :different_skill_names, :service_professionally_names, :service_not_professionally_names, :mentor_names)
  end

 end
