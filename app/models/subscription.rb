class Subscription < ApplicationRecord
  enum status: [:applied, :dropped, :finished]
  belongs_to :user
  belongs_to :job
end
