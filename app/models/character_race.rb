class CharacterRace < ActiveRecord::Base
  belongs_to :character
  belongs_to :race
end
