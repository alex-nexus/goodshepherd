# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    description "MyString"
    year 1
    location "MyString"
    start_date "2013-07-04 01:07:03"
    end_date "2013-07-04 01:07:03"
    type ""
    church_id 1
    registration_deadline "2013-07-04 01:07:03"
    contact_user_id 1
  end
end
