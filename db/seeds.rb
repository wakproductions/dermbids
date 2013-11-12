# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Code below has been moved to /db/seeds/users.rb
#[['wak@wakproductions.com', 'Winston', 'Kotzan']].each do |email, first_name, last_name|
#  admin_user = User.find_or_create_by(:email=>email)
#  admin_user.update(
#      {
#          user_type: User::TYPES[:admin],
#          first_name: first_name,
#          last_name: last_name,
#          password: (admin_user.encrypted_password.present? ? nil : Devise.friendly_token.first(8))
#      }
#  )
#  admin_user.save!
#end

# Create the initial set of clinics in the Chicago area

clinic_user = User.create(
      user_type: User::TYPES[:provider],
      first_name: 'Monika',
      email: 'monika@vamoosetattooremoval.com'
)

Clinic.create(
    business_name: 'Vamoose Tattoo Removal',
    city: 'Chicago',
    state_id: '13',
    quote_request_contact_user_id: clinic_user.id
)

clinic_user = User.create(
    user_type: User::TYPES[:provider],
    first_name: 'Bob',
    email: 'hindsighttattooremoval@gmail.com'
)

Clinic.create(
    business_name: 'Hindsight Studios',
    city: 'Chicago',
    state_id: '13',
    quote_request_contact_user_id: clinic_user.id
)

clinic_user = User.create(
    user_type: User::TYPES[:provider],
    first_name: 'Anthony',
    email: 'erasetattoo100@gmail.com'
)

Clinic.create(
    business_name: 'Erase Laser Tattoo Removal',
    city: 'Chicago',
    state_id: '13',
    quote_request_contact_user_id: clinic_user.id
)

clinic_user = User.create(
    user_type: User::TYPES[:provider],
    first_name: 'Cheighton',
    email: 'cleighton@sempurnaclinic.com'
)

Clinic.create(
    business_name: 'Sempurna Restoration Clinic',
    city: 'Chicago',
    state_id: '13',
    quote_request_contact_user_id: clinic_user.id
)

clinic_user = User.create(
    user_type: User::TYPES[:provider],
    first_name: 'Pandit',
    email: 'drpandit@sbcglobal.net'
)

Clinic.create(
    business_name: 'Pandit',
    city: 'Chicago',
    state_id: '13',
    quote_request_contact_user_id: clinic_user.id
)

clinic_user = User.create(
    user_type: User::TYPES[:provider],
    first_name: 'ahpiera',
    email: 'ahpiera@lipodoc.com'
)

Clinic.create(
    business_name: 'Liposuction & Cosmetic Surgery Institute',
    city: 'Chicago',
    state_id: '13',
    quote_request_contact_user_id: clinic_user.id
)
