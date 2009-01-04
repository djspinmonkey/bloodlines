class Marriage < ActiveRecord::Base
  has_many :characters

  def husband
    @husband ||= characters.select{ |c| c.male? }.first
  end

  def wife
    @wife ||= characters.select{ |c| c.female? }.first
  end

end
