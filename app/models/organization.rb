class Organization < ApplicationRecord
  validates :name, :cnpj, :phone, presence: true
end
