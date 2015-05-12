class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :edit, :update, :destroy]

  def index
    @skills = Skill.all
  end

  def show
    @skill = Skill.find(params[:id])
  end

  def new
    @skill = Skill.new
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def create
    @skill = Skill.new(skill_params)
      if @skill.save
        redirect_to @skill, notice: 'Skill was successfully created.'
      else
        render :new, notice: 'Skill was successfully created.'
      end
  end

  def update
    @skill = Skill.find(params[:id])
  end

  def destroy
    @skill.destroy
      redirect_to skills_url, notice: 'Skill was successfully destroyed.'
  end

  private
    def set_skill
      @skill = Skill.find(params[:id])
    end

    def skill_params
      params.require(:skill).permit(:name)
    end

end
