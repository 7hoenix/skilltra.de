class AddImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image, :image
  end
end
