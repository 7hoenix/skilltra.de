class AddUserIdToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :user_id, :integer
    add_index :credits, :user_id
  end
end
