class AddPostIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :post_id, :integer
    add_index :jobs, :post_id
  end
end
