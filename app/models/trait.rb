class Trait < ActiveRecord::Base
  has_many :characters, :through => :character_traits
  has_and_belongs_to_many :races
  has_and_belongs_to_many :prerequisites, :class_name => "Trait", :join_table => "trait_prerequisites", :association_foreign_key => "prerequisite_id"
  serialize :bonuses

  before_create :initialize_bonus_hash
  validate :has_valid_bonus_hash


  def method_missing (sym, *args)
    if sym.to_s.ends_with?("_bonus")
      type = sym.to_s.sub(/_bonus$/, '')
      return bonus(type)
    end

    super
  end

  def bonus (type)
    return 0 if bonuses[type].nil?
    return bonuses[type]
  end

  def set_bonus (type, value)
    bonuses[type.to_sym] = value.to_int
  end

  def bonus_string
    strings = []
    bonuses.keys.sort.each do |k|
      value = bonuses[k]
      sign = (value > 0) ? "+" : ""     # we only need to add the plus signs
      strings.push "#{k} #{sign}#{value}"
    end
    strings.join(", ")
  end

  def initialize_bonus_hash
    bonuses ||= {}
  end

  def has_valid_bonus_hash
    bonuses.kind_of? Hash
  end

end
