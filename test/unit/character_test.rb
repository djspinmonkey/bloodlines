require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  context "A character" do
    setup do
      @char = characters(:bob)
      @char.race = races(:human)
    end

    should "be able to have traits added" do
      @char.add_trait(traits(:vanilla))
      @char.save

      assert_equal 1, @char.traits.size, "Wrong number of traits after assignment"
      assert_equal traits(:vanilla), @char.traits.pop, "Wrong trait assigned"
    end

    should "not change if adding a trait it already has" do
      @char.add_trait(traits(:vanilla))
      @char.save

      @char.add_trait(traits(:vanilla))
      @char.save

      assert_equal 1, @char.traits.size, "Wrong number of traits after double assignment"
    end

    should "be able to have traits removed" do
      @char.add_trait(traits(:vanilla))
      @char.add_trait(traits(:strong))
      @char.add_trait(traits(:really_strong))
      @char.save

      assert_equal 3, @char.traits.size, "Wrong number of traits after assignment"
      @char.remove_trait(traits(:strong))
      assert_equal 2, @char.traits.size, "Wrong number of traits after removal"
      @char.remove_trait(traits(:vanilla))
      assert_equal traits(:really_strong), @char.traits.pop, "Wrong trait remaining after deletion"
    end

    should "return dynamically calculated bonuses when #foo_bonus is called" do
      @char.add_trait(traits(:strong))
      @char.add_trait(traits(:really_strong))
      @char.save

      assert_equal 1, traits(:strong).strength_bonus
      assert_equal 5, traits(:really_strong).strength_bonus

      assert_equal 6, @char.strength_bonus, "Incorrect strength bonus"
      assert_equal 0, @char.bogus_bonus, "Non-zero bogus bonus"
    end

    should "have stats" do
      assert_equal 10, @char.strength

      @char.add_trait(traits(:strong))
      @char.save
      assert_equal 11, @char.strength

      @char.add_trait(traits(:really_strong))
      assert_equal 16, @char.strength

      @char.remove_trait(traits(:strong))
      assert_equal 15, @char.strength
    end

    context "in a location" do
      setup do
        @char.location = locations(:home)
      end

      should "know it's location" do
        assert_equal locations(:home), @char.location
      end
    end
  end
end
