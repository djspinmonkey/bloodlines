require 'mathn'

class Character < ActiveRecord::Base
  belongs_to :house
  belongs_to :location
  belongs_to :marriage
  belongs_to :parents, :class_name => 'Marriage'
  has_many :traits, :through => :character_traits
  has_many :races, :through => :character_races
  has_many :character_traits, :include => :trait
  has_many :character_races, :include => :race

  before_create :add_all_racial_traits

  attr_accessor :new_marriage
  alias_method :new_marriage?, :new_marriage

  # TODO: validations on characters

  MALE = 'male'
  FEMALE = 'female'
  GENDERS = [MALE, FEMALE]
  STATS = [:strength]  # TODO: figure out what the stats are, and where they live

  # the odds that a given racial trait will come from a parent (instead of
  # being a random trait from the appropriate race)
  HERITABILITY = 0.9

  def init_parents_id
    return nil
  end

  def init_parents_id=(parents_id)
    self.parents = Marriage.find(parents_id)

    half_parts = []
    (parents.husband.races + parents.wife.races).uniq.each do |race|
      parent_parts = parents.husband.parts(race) + parents.wife.parts(race)
      character_races << CharacterRace.new(:character => self, 
					   :race => race, 
					   :parts => parent_parts / 2) if parent_parts > 1
      half_parts << race if parent_parts.odd?
    end
    (half_parts.size / 2).times { add_part(half_parts.delete_at(rand(half_parts.size))) }
  end

  def spouse
    @spouse ||= marriage.nil? ? nil : (marriage.characters - [self]).first
  end

  def spouse_name
    spouse.nil? ? "none" : spouse.name
  end

  def spouse_id
    spouse.nil? ? "none" : spouse.id
  end

  def spouse_id= (id)
    return if id.to_i == -1
    raise "Cannot update spouse once a character is married" if married?
    sp = Character.find(id)
    mar = Marriage.new
    mar.characters = [self, sp]
    mar.save
  end

  # Currently, this does not allow teh gay.  To change that, just remove the
  # gender clause from the conditions.
  def potential_spouses
    Character.find(:all, :conditions => "house_id = #{self.house_id} and 
		   marriage_id is null and gender != '#{self.gender}'")
  end

  def racial_traits (race = nil)
    these_traits = []
    character_traits.each { |ct| these_traits.push ct.trait if race.nil? or ct.race == race }
    return these_traits
  end

  def add_trait (trait, race = nil)
    return if character_traits.select { |ct| ct.trait == trait }.size > 0
    ct = CharacterTrait.new(:character => self, :trait => trait, :race => race)
    self.character_traits.push ct
  end

  def remove_trait (trait)
    cts = character_traits.select { |ct| ct.trait == trait }
    cts.each do |ct|
      self.character_traits.delete(ct)
      ct.destroy
    end
  end

  def parts (race)
    character_races.each { |cr| return cr.parts if cr.race == race }
    return 0
  end

  def race= (race)
    race = Race.find(race) if (race.is_a? Integer)
    race = Race.find_by_name(race) if (race.is_a? String)

    character_races.clear
    race_parts = CharacterRace.new(:character => self, :race => race, :parts => 16)
    character_races << race_parts
  end

  # This is just so the select tag helper works
  def race
    return race_string
  end

  def race_string
    strings = []
    character_races.each do |cr|
      return cr.race.name if cr.parts == 16

      denom = cr.parts.gcd(16)
      strings.push("#{cr.parts / denom}/#{16 / denom} #{cr.race.name}")
    end
    strings.join(", ")
  end

  def married?
    !marriage.nil?
  end

  def male?
    gender == MALE
  end

  def female?
    gender == FEMALE
  end


  # FIXME something in 'add_all_racial_traits' is allowing dupe racial traits
  def add_all_racial_traits
    # figure out parent traits
    #
    parent_traits = {}
    if not parents.nil?
      father = parents.husband
      mother = parents.wife

      parent_races = (father.races + mother.races).uniq
      parent_races.each { |r| parent_traits[r] = (father.racial_traits(r) + 
						  mother.racial_traits(r)).uniq }
    end

    # figure out parent races
    #
    slots = []
    character_races.each do |cr|
      cr.parts.times { slots.push cr.race }
    end

    # add each trait in random order
    #
    slots.shuffle!.each do |r| 
      new_trait = nil
      if (parent_traits[r] and (Kernel.rand < HERITABILITY))
        new_trait = parent_traits[r].rand
      else
        new_trait = (r.traits - current_traits).rand
      end

      # remove the new trait from the parent_traits hash
      parent_traits.each do |this_race, these_traits|
        these_traits.reject! { |t| t == new_trait }
        parent_traits.delete(this_race) if these_traits.empty?
      end

      add_trait(new_trait, r)
    end
  end

  def add_part (race)
    character_races.each { |cr| return cr.parts += 1 if cr.race == race }
    character_races << CharacterRace.new(:character => self, :race => race, :parts => 1)
  end

  def current_traits
    character_traits.collect { |cr| cr.trait }
  end

  def bonuses
    # TODO cache bonuses?
    bonus_hash = {}
    character_traits.collect(&:trait).each do |t|
      next if t.nil? or t.bonuses.nil?
      t.bonuses.each do |type, bonus|
        bonus_hash[type] ||= 0
        bonus_hash[type] += bonus || 0
      end
    end

    bonus_hash
  end

  def bonus(type)
    bonuses[type] || 0
  end

  def method_missing (sym, *args)
    # dynamic foo_bonus methods
    if sym.to_s.ends_with?("_bonus")
      type = sym.to_s.sub(/_bonus$/, '')
      return bonus(type)
    end

    if STATS.include? sym
      return 10 + bonus(sym.to_s)
    end

    super
  end

end
