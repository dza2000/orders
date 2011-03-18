class Station < ActiveRecord::Base
  belongs_to :state
  has_many :profile_addons
    
  def dropdownselect
    "#{self.call_letters} #{self.city}, #{self.state_id}"
  end
end
