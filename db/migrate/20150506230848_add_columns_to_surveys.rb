class AddColumnsToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :reviewed_id, :integer
    add_column :surveys, :reviewer_id, :integer
    add_column :surveys, :testimonial, :string
    add_column :surveys, :skill_set, :string
    add_column :surveys, :months_of_experience, :integer
    add_column :surveys, :projects_completed, :integer
    add_column :surveys, :page_count, :integer
    add_column :surveys, :user_id, :integer
    add_index :surveys, :user_id

  end
end
