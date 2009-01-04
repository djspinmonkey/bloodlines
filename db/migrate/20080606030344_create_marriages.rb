class CreateMarriages < ActiveRecord::Migration
  def self.up
    create_table :marriages do |t|
      t.integer :husband_id
      t.integer :wife_id

      t.timestamps
    end
  end

  def self.down
    drop_table :marriages
  end
end
