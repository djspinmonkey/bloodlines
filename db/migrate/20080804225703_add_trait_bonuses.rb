class AddTraitBonuses < ActiveRecord::Migration
  def self.up
    add_column :traits, :bonuses, :string
  end

  def self.down
    remove_column :traits, :bonuses
  end
end
