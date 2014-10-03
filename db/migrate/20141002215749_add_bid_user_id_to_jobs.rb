class AddBidUserIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :bid_user_id, :integer
  end
end
