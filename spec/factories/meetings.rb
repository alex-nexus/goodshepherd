# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meeting do
    church_id 1
    name "MyString"
    start_time "2013-03-06 23:42:58"
    end_time "2013-03-06 23:42:58"
    location "MyString"
    description "MyString"
  end
end
