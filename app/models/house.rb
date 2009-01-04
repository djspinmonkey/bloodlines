class House < ActiveRecord::Base
  has_many :marriages, :through => :characters, :uniq => true
  has_many :characters do
    memoized_finder :unmarried, 'marriage_id is null'
  end

end
