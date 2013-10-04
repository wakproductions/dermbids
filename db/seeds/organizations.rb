# Creates a list of clinics
# Last updated: 9/24/13

org1 = {
  business_name: 'Winston Chicago Clinic (Test)',
  postal_code: 60601,
  quote_request_contact_user_id: User.admins.where(email: 'wak@wakproductions.com')
}
Clinic.create(org1)