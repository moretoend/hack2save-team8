FactoryGirl.define do
  factory :user do
    email 'user@mail.com'
    password 'password'
    password_confirmation 'password'
  end
end
