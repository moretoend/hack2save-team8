class Organization::Address < ApplicationRecord
  validate do |address|
    ::AddressValidator.new(address).validate
  end

  belongs_to :organization
end
