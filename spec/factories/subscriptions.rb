FactoryGirl.define do
  factory :subscription do
    user nil
    job nil
    notes "MyText"
    status 1
  end

  trait :with_user do
    association :user, factory: :user
  end

  trait :with_job do
    association :job, factory: :job
  end
end
