class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :bio

      t.timestamps
    end
  end
end
