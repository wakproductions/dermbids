# This creates an inital admin user. Originally the code below was the only code in /db/seeds.rb
[
    ['wak@wakproductions.com', 'Winston', 'Kotzan'],
    ['eric@dermbids.com', 'Eric', 'Zabinski']
].each do |email, first_name, last_name|
  admin_user = User.find_or_create_by(:email=>email)
  admin_user.update(
      {
          user_type: User::TYPES[:admin],
          first_name: first_name,
          last_name: last_name,
          #password: (admin_user.encrypted_password.present? ? nil : Devise.friendly_token.first(8))
          password: dermbids
      }
  )
  admin_user.save!
end