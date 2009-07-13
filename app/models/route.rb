class Route < ActiveRecord::Base
  belongs_to :origin, :class_name => 'Location'
  belongs_to :destination, :class_name => 'Location'

  validates_presence_of :origin
  validates_presence_of :destination
end
