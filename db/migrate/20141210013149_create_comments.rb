class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :blog_id
      t.string :commenter

      t.timestamps
    end
    add_index :comments, :blog_id
  end
end
