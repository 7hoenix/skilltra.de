class AddJobsCompletedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :jobs_completed, :integer
  end
end
