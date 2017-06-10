FactoryGirl.define do
  factory :job do
    sequence(:title) { |n| "Job #{n}" }
    kind "Health care"
    places 2
    description "Help families on Iraq war"
    start_date "2017-06-06"
    end_date "2017-07-15"
    organization
  end
end
