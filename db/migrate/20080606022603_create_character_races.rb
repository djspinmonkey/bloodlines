class CreateCharacterRaces < ActiveRecord::Migration
  def self.up
    create_table :character_races do |t|
      t.integer :character_id
      t.integer :race_id
      t.integer :parts

      t.timestamps
    end
  end

  def self.down
    drop_table :racial_memberships
  end
end
