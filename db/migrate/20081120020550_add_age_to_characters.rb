class AddAgeToCharacters < ActiveRecord::Migration
  def self.up
    add_column :characters, :age, :integer
  end

  def self.down
    remove_column :characters, :age
  end
end
