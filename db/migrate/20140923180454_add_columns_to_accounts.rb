class AddColumnsToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :primarySkill, :string
    add_column :accounts, :secondarySkill, :string
  end
end
