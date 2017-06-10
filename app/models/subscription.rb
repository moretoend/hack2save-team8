class Subscription < ApplicationRecord
  extend Enumerize

  belongs_to :user
  belongs_to :job
  has_one :review

  enumerize :status, in: [:pending, :accepted, :denied, :canceled, :closed ], scope: true, default: :pending

end
