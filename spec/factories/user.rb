FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "user#{ i }@example.org" }
    password 'password'
    password_confirmation { |user| user.password }
  end
end