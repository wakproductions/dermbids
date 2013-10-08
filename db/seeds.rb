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

