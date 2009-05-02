require 'test_helper'

class MarriageTest < ActiveSupport::TestCase

  def test_teh_gay
    adam  = characters(:dude1)
    steve = characters(:dude2)
    first_dude_id = [adam.id, steve.id].min

    m = Marriage.new
    m.characters = [adam, steve]

    assert_equal 2, m.characters.size, "Wrong number of members found in gay marriage"
    assert_nil m.wife_id
    assert_equal first_dude_id, m.husband_id, "Found wrong husband id for gay marriage (which is maybe ambiguous anyway)"
  end

end
