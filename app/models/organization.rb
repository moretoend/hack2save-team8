class Organization < ApplicationRecord
  belongs_to :responsible, class_name: 'User', foreign_key: "user_id"
  has_many :jobs

  enum service_kind: [ :industry, :commerce, :service ]
  validates :name, :cnpj, :phone, presence: true

  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  validates_associated :address
end
