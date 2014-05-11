FactoryGirl.define do
  factory :user do
    email { Forgery(:email).address }
    password { Forgery(:basic).password(:at_least => 8) }
    password_confirmation { |user| user.password }
  end
end