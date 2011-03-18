class Phone < ActiveRecord::Base
  belongs_to :contact
  
  PHONETYPE = ['Personal', 'Business']
end
