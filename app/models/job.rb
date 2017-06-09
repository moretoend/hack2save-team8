class Job < ApplicationRecord
  belongs_to :organization
  has_many :subscriptions

  has_many :users, through: :subscriptions 

  validates :title, presence: true
  validates :kind, presence: true
  validates :places, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
