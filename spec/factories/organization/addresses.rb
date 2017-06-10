FactoryGirl.define do
  factory :organization_address, class: Organization::Address do
    country 'Country'
    state 'State'
    city 'City'
    neighborhood 'Neighborhood'
    street 'Street'
    number '100'
    association :organization, strategy: :build
  end
end
