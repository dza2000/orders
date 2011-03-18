class Email < ActiveRecord::Base
  belongs_to :contact
  
  EMAILTYPE = ['Personal', 'Business']
  
  FORMAT = ['HTML', 'Plain-Text']
end
