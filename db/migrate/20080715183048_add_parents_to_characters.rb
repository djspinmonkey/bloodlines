class AddParentsToCharacters < ActiveRecord::Migration
  def self.up
    add_column :characters, :parents_id, :integer
  end

  def self.down
    remove_column :characters, :parents_id
  end
end
