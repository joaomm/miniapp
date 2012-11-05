# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task_list do
    name "New Task List"
    privacy "private"
    association :user
  end
end
