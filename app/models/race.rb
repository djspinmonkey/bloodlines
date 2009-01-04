class Race < ActiveRecord::Base
  has_many :characters, :through => :character_races
  has_and_belongs_to_many :traits
end
