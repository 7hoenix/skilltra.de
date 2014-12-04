class CreatePreferred < ActiveRecord::Migration
  def change
    create_table :preferreds do |t|
      t.string :startup_name
      t.string :description
    end
  end
end
