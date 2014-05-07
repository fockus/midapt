FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "user#{n}@users.org"
    end
    password 'password'
    password_confirmation { |user| user.password }
  end
end