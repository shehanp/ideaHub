# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vote do
    value 1
    voteable_id ""
    votable_type "MyString"
  end
end
