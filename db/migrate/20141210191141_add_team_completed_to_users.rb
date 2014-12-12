class AddTeamCompletedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :team_completed, :boolean
  end
end
