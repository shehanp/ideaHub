# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  factory :comment do
    body Faker::Lorem.sentence
  end

  factory :discussion do 
    body Faker::Lorem.paragraph
  end

end
