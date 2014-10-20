class AddAverageScoreToUsers < ActiveRecord::Migration
  def change
    add_column :users, :average_score, :float
  end
end
