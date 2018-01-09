# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :weekly_meeting do
    church_id 1
    name "MyString"
    start_time "2013-03-06 23:46:01"
    end_time "2013-03-06 23:46:01"
    weekday 1
    location "MyString"
    description "MyString"
  end
end
