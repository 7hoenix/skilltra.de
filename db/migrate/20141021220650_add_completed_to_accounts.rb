class AddCompletedToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :completed, :boolean
  end
end
