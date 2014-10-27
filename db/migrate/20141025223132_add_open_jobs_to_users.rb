class AddOpenJobsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :open_jobs, :integer
  end
end
