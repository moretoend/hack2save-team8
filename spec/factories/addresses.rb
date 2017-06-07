FactoryGirl.define do
  factory :address do
    country 'Country'
    city 'City'
    neighborhood 'Neighborhood'
    street 'Street'
    number '100'

    association :addressable, factory: :organization
  end
end
