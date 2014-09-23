class AddCompanyToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :company, :string
  end
end
