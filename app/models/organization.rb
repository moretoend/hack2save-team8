class Organization < ApplicationRecord
  enum service_kind: [ :industry, :commerce, :service ]
  validates :name, :cnpj, :phone, presence: true
end
