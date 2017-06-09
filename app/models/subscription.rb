class Subscription < ApplicationRecord
  extend Enumerize

  belongs_to :user
  belongs_to :job

  enumerize :status, in: [:pending, :accepted, :denied, :canceled, :ended ], scope: true, default: :pending

end
