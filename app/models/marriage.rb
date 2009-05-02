class Marriage < ActiveRecord::Base
  has_many :characters

  def husband
    @husband ||= characters.select{ |c| c.male? }.sort_by(&:id).first
  end

  def husband_id
    self.husband ? self.husband.id : nil
  end

  def wife
    @wife ||= characters.select{ |c| c.female? }.sort_by(&:id).first
  end

  def wife_id
    self.wife ? self.wife.id : nil
  end

end
