FactoryGirl.define do
  factory :user do
    name 'user'
    email 'user@mail.com'
    password 'password'
    password_confirmation 'password'
  end

  factory :responsible, class: User do
    name 'Responsible'
    email 'responsible@mail.com'
    password 'password'
    password_confirmation 'password'
  end
end
