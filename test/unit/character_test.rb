require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  def setup
    @trait1 = Trait.new(:name => "Test Trait", :description => "an exciting test")
    @trait2 = Trait.new(:name => "Strong", 
			:description => "bend bars and stuff", 
			:bonuses => {'strength' => 1})
    @trait3 = Trait.new(:name => "Really Strong", 
			:description => "bend bars and stuff... a lot!", 
			:bonuses => {'strength' => 5})

    @char = Character.new(:name => "Bob Schmo")

    @race = Race.new(:name => "Human")

    @char.race
  end

  def test_add_trait
    @char.add_trait(@trait1)
    @char.save

    assert_equal 1, @char.traits.size, "Wrong number of traits after assignment"
    assert_equal @trait1, @char.traits.pop, "Wrong trait assigned"
  end

  def test_remove_trait
    @char.add_trait(@trait1)
    @char.add_trait(@trait2)
    @char.add_trait(@trait3)
    @char.save

    assert_equal 3, @char.traits.size, "Wrong number of traits after assignment"
    @char.remove_trait(@trait2)
    assert_equal 2, @char.traits.size, "Wrong number of traits after removal"
    @char.remove_trait(@trait1)
    assert_equal @trait3, @char.traits.pop, "Wrong trait remaining after deletion"
  end

  def test_add_random_racial_trait
  end

  def test_bonuses
    @char.add_trait(@trait2)
    @char.add_trait(@trait3)
    @char.save

    assert_equal 1, @trait2.strength_bonus
    assert_equal 5, @trait3.strength_bonus

    assert_equal 6, @char.strength_bonus, "Incorrect strength bonus"
    assert_equal 0, @char.bogus_bonus, "Non-zero bogus bonus"
  end

end
