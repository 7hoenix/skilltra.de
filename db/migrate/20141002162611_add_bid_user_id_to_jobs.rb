class AddBidUserIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :bid_user_id, :integer
    add_index :jobs, :bid_user_id
  end
end
