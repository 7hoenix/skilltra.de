class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :bid
      t.string :bidinfo

      t.timestamps
    end
  end
end
