class Location < ActiveRecord::Base
  belongs_to :region
  has_many :routes, :foreign_key => 'origin_id'

  validates_presence_of :region
end
