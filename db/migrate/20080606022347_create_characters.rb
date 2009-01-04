class CreateCharacters < ActiveRecord::Migration
  def self.up
    create_table :characters do |t|
      t.string :name
      t.string :gender
      t.integer :house_id
      t.integer :spouse_id

      t.timestamps
    end
  end

  def self.down
    drop_table :characters
  end
end
