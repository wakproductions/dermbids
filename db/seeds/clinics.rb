# Creates a list of clinics
# Last updated: 9/24/13

org = {
  business_name: "Winston's Chicago Clinic (Test)",
  postal_code: 60601,
  state_id: State.find_state('IL').id,
  quote_request_contact_user_id: User.admins.where(email: 'wak@wakproductions.com')
}
Clinic.create(org)

org = {
    business_name: "Eric's Tattoo Removal Shop (Test)",
    postal_code: 60601,
    state_id: State.find_state('IL').id,
    quote_request_contact_user_id: User.admins.where(email: 'eric@dermbids.com')
}
Clinic.create(org)