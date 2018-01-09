# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :membership do
    user_id 1
    church_id 1
    is_active false
  end
end
