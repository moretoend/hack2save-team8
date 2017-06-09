FactoryGirl.define do
  factory :organization do
    name "Organization"
    cnpj "3129031212"
    phone "+42 (51) 12311-3123"
    sequence(:email) { |n| "email#{n}@org.com" }
    association :responsible, factory: :user
  end

  trait :with_responsible do
    association :user, factory: :responsible
  end
end
