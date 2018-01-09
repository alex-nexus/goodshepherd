# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attendance do
    user_id 1
    meeting_id 1
    is_active false
  end
end
