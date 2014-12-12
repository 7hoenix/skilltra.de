class TeamMembersController < ApplicationController
  before_filter :setup_team_members, only: [:create]

  def create
    TeamMember.request(@user, @team)
    flash[:notice] = "Team request sent."
    redirect_to posts_path
  end

  def index
    @team_members = TeamMember.all
  end

  private

  def setup_team_members
    @user = User.find_by_id(params[:user_id])
    @team = User.find_by_id(params[:id])
  end

  def team_member_params
    params.require(:team_members).permit(:user_id, :team_id, :status)
  end
end
