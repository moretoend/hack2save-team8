class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :job

  enum status: [:pending, :accept, :declined, :cancel, :ended ]

end
