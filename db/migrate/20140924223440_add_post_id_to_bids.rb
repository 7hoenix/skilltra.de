class AddPostIdToBids < ActiveRecord::Migration
  def change
    add_column :bids, :post_id, :integer
    add_index :bids, :post_id
  end
end
