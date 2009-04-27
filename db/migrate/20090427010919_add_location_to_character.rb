class AddLocationToCharacter < ActiveRecord::Migration
  def self.up
    add_column :characters, :location_id, :integer
  end

  def self.down
    remove_column :characters, :location_id
  end
end
