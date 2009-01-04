class CreateTraitPrerequisitesTable < ActiveRecord::Migration
  def self.up
    create_table :trait_prerequisites, :id => false do |t|
      t.integer :trait_id, :prerequisite_id
    end
  end

  def self.down
    drop_table :trait_prerequisites
  end
end
