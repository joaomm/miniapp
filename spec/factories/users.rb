# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "username#{n}@domain.com"}
    password "123123"
  end
end
