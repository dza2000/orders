class SegmentDetail < ActiveRecord::Base
  belongs_to :segment
  belongs_to :contact
end
