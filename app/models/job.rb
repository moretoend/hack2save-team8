class Job < ApplicationRecord
  belongs_to :organization
  has_many :subscriptions
end
