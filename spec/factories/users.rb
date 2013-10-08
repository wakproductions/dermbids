FactoryGirl.define do
  factory :patient_user, :class=>User do
    user_type User::TYPES[:patient]
    first_name 'Regular'
    last_name 'Joe'
    email 'regular.joe-patient-factorygirl@wakproductions.com'
    password 'something'
  end

  factory :admin_user, :class=>User do
    user_type User::TYPES[:admin]
    first_name "Winston"
    last_name "Kotzan"
    email "wak-admin-factorygirl@wakproductions.com"
    password "something"
  end

  factory :provider_user, :class=>User do
    user_type User::TYPES[:provider]
    first_name 'Doogie'
    last_name 'Howser'
    email 'doogie.howser-provider-factorygirl@wakproductions.com'
    password 'something'
  end
end
