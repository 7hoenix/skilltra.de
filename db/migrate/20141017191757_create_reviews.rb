class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :score
      t.integer :reviewee_id
      t.integer :reviewer_id
      t.integer :job_id
    end
    add_index :reviews, :job_id
  end
end
