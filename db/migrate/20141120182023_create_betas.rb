class CreateBetas < ActiveRecord::Migration
  def change
    create_table :beta do |t|
      t.string :email
      t.string :skill
    end
  end
end
