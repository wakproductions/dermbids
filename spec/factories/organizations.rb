# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :organization do
    business_name "Winston's Shady Clinic"
    address1 "13 West Elm St"
    city "Scary"
    state_id 25
    postal_code "46240"
    #quote_request_contact_user_id 1
  end
end
