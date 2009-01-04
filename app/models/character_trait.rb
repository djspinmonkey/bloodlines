class CharacterTrait < ActiveRecord::Base
  belongs_to :character
  belongs_to :trait
  belongs_to :race
end
