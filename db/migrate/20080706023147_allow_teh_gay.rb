class AllowTehGay < ActiveRecord::Migration
  def self.up
    remove_column :marriages, :husband_id
    remove_column :marriages, :wife_id
    add_column :characters, :marriage_id, :integer
  end

  def self.down
    add_column :marriages, :husband_id, :integer
    add_column :marriages, :wife_id, :integer
    remove_column :characters, :marriage_id
  end
end
