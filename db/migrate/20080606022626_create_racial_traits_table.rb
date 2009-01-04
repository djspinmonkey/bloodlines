class CreateRacialTraitsTable < ActiveRecord::Migration
  def self.up
    create_table :races_traits, :id => false do |t|
      t.integer :race_id, :trait_id
    end
  end

  def self.down
    drop_table :races_traits
  end
end
