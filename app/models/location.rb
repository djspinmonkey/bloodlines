class Location < ActiveRecord::Base
  belongs_to :region

  validates_presence_of :region
end
