class AddAccountCompletedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :account_completed, :boolean
  end
end
