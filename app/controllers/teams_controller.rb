class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
      if @team.save
        redirect_to @team, notice: 'Team was successfully created.'
      else
        render :new, notice: 'Account was successfully created.'
      end
  end

  def show
  end

  def index

  end

  def edit

  end

  def update

  end

  def destroy

  end


  private
  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:team_name, :team_id)
  end

end