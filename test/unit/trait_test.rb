require 'test_helper'

class TraitTest < ActiveSupport::TestCase

  def test_bonuses
    t = Trait.new(:name => 'test1')
    t.bonuses = {'strength' => 2, 'fire' => 1}
    t.save
    id = t.id

    t = nil
    t = Trait.find(id)
    assert_equal(2, t.strength_bonus, "Incorrect strength bonus")
    assert_equal(1, t.fire_bonus, "Incorrect fire bonus")
    assert_equal('fire +1, strength +2', t.bonus_string, "Incorrect bonus string with all positive bonuses")

    t.bonuses['mana'] = -3
    t.save

    t = Trait.find(id)
    assert_equal('fire +1, mana -3, strength +2', t.bonus_string, "Incorrect bonus string with mixed positive and negative bonuses")
  end

end
