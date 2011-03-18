class ProfileAddon < ActiveRecord::Base
  belongs_to :contact
  belongs_to :station
end
