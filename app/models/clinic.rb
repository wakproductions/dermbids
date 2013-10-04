class Clinic < ActiveRecord::Base
  belongs_to :quote_request_contact, class_name: :User, foreign_key: :quote_request_contact_user_id
  has_many :clinic_quote_requests

  #TODO Write tests for these scopes
  scope :already_quote_requested, ->(quote_request) { joins(:clinic_quote_requests).where(clinic_quote_requests: { quote_request_id: quote_request }) }
  scope :not_yet_quote_requested, ->(quote_request) { where.not(id: ClinicQuoteRequest.eager_load(:clinic).where(:clinic_quote_requests=>{quote_request_id:quote_request}).map { |r| r.clinic_id })  }

  def state
    State.find(self.state_id).abbr if state_id.present?
  end
end
