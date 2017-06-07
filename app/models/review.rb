class Review < ApplicationRecord
  belongs_to :subscription
  belongs_to :job
end
