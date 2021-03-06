class Clinic < ActiveRecord::Base
  belongs_to :quote_request_contact, class_name: :User, foreign_key: :quote_request_contact_user_id
  has_many :clinic_communications
  accepts_nested_attributes_for :quote_request_contact
  attr_accessor :state

  #TODO-TEST Write tests for these scopes
  scope :already_quote_requested, ->(quote_request) { joins(:clinic_communications).where(clinic_communications: { quote_request_id: quote_request, communication_type: ClinicCommunication::COMMUNICATION_TYPES[:quote_request] }).distinct }
  scope :not_yet_quote_requested, ->(quote_request) { where.not(id: ClinicCommunication.eager_load(:clinic).where(clinic_communications: {quote_request_id:quote_request, communication_type: ClinicCommunication::COMMUNICATION_TYPES[:quote_request]}).map { |r| r.clinic_id })  }

  def state
    State.find(self.state_id).abbr if state_id.present?
  end

  def state=(abbr)
    self.state_id = State.find_by(abbr: abbr).id
  end

  def sent_quote_request_patient_details?(quote_request)
    clinic_communications.exists?(quote_request: quote_request, communication_type: ClinicCommunication::COMMUNICATION_TYPES[:send_patient_details]).present?
  end

end
