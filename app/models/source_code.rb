class SourceCode < ActiveRecord::Base
  belongs_to :source_code_type
  has_many :transactions
end
