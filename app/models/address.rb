class Address < ApplicationRecord
  validate do |address|
    ::AddressValidator.new(address).validate
  end

  belongs_to :addressable, polymorphic: true
end
