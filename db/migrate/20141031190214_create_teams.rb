class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :team_name
      t.integer :owner_id
      t.string :owner_name
    end
  end
end
