# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :forked_idea do
    title "MyString"
    body "MyText"
    fork_id 1
    image "MyString"
  end
end
