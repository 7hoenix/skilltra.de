class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :completed, :boolean
    add_column :users, :verified, :integer
    add_column :users, :skill_set, :string
    add_column :users, :months_of_experience, :integer
    add_column :users, :projects_completed, :integer
    add_column :users, :testimonial, :text
    add_column :users, :same_skill_names, :text
    add_column :users, :different_skill_names, :text
    add_column :users, :service_professionally_names, :text
    add_column :users, :service_not_professionally_names, :text
    add_column :users, :mentor_names, :text
  end
end
