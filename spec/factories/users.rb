# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    user_type 1
    first_name "MyString"
    last_name "MyString"
  end
end
