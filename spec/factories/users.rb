FactoryGirl.define do
  factory :patient_user, :class=>User do
    user_type User::TYPES[:patient]
    first_name 'Regular'
    last_name 'Joe'
    email 'regular.joe-test@wakproductions.com'
    password 'something'
  end

  factory :admin_user, :class=>User do
    user_type User::TYPES[:admin]
    first_name "Winston"
    last_name "Kotzan"
    email "wak-factorygirl@wakproductions.com"
    password "something"
  end

end
