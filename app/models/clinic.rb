class Clinic < ActiveRecord::Base
  belongs_to :quote_request_contact, class_name: :User, foreign_key: :quote_request_contact_user_id
  has_many :clinic_quote_requests


  def state
    State.find(self.state_id).abbr if state_id.present?
  end
end
