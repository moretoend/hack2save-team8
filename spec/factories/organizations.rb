FactoryGirl.define do
  factory :organization do
    name "MyString"
    cnpj "MyString"
    phone "MyString"
    email "MyString"
  end

  trait :with_responsible do
    association :user, factory: :responsible
  end
end
