class CreateCharacterTraits < ActiveRecord::Migration
  def self.up
    create_table :character_traits do |t|
      t.integer :character_id
      t.integer :trait_id
      t.integer :race_id

      t.timestamps
    end
  end

  def self.down
    drop_table :character_traits
  end
end
