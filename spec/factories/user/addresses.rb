FactoryGirl.define do
  factory :user_address, class: User::Address do
    country 'Country'
    state 'State'
    city 'City'
    neighborhood 'Neighborhood'
    street 'Street'
    number '100'
    association :user, strategy: :build
  end
end
