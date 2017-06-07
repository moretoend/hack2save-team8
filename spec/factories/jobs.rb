FactoryGirl.define do
  factory :job do
    organization nil
    title "Job 01"
    kind "War"
    places 2
    description "Help families on Iraq war"
    start_date "2017-06-06"
    end_date "2017-07-15"
  end
end
