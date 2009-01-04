class Trait < ActiveRecord::Base
  has_many :characters, :through => :character_traits
  has_and_belongs_to_many :races
  has_and_belongs_to_many :prerequisites, :class_name => "Trait", :join_table => "trait_prerequisites", :association_foreign_key => "prerequisite_id"
  serialize :bonuses

  def method_missing (sym, *args)
    if sym.to_s.ends_with?("_bonus")
      type = sym.to_s.sub(/_bonus$/, '')
      return bonus(type)
    end

    super
  end

  def bonus (type)
    return 0 if bonuses.nil? or bonuses[type].nil?
    return bonuses[type]
  end

  def bonus_hash
    bonuses.nil? ? {} : bonuses
  end

  def bonus_string
    return '' if bonuses.nil?
    strings = []
    bonuses.keys.sort do |k|
      v = bonuses[k] || 0
      sign = (v > 0) ? "+" : ""     # we only need to add the plus signs
      strings.push "#{k} #{sign}#{v}"
    end
    strings.join(", ")
  end

end
