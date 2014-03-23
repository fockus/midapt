FactoryGirl.define do
  factory :user do
    email 'user@users.org'
    password 'password'
    password_confirmation { |user| user.password }
  end
end