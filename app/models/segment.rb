class Segment < ActiveRecord::Base
  has_many :contacts, :through => :segment_details
end
