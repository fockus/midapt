FactoryGirl.define do
  factory :user do
    sequence :email do
      Forgery(:email).address
    end
    password Forgery(:basic).password(:at_least => 8)
    password_confirmation { |user| user.password }
  end
end