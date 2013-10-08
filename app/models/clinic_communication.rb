class ClinicCommunication < ActiveRecord::Base
  COMMUNICATION_TYPES = {
      quote_request: 1,
      send_patient_details: 2
  }

  belongs_to :initiated_by_user, class_name: 'User', foreign_key: :initiated_by_user_id
  belongs_to :clinic
  belongs_to :quote_request

  validates_presence_of :communication_type
  validates_presence_of :clinic
  validates_presence_of :quote_request

  def send_email_to_clinic
    case self.communication_type
      when COMMUNICATION_TYPES[:quote_request]
        QuoteRequestMailer.request_quote_from_provider(quote_request, clinic).deliver
      when COMMUNICATION_TYPES[:send_patient_details]
        QuoteRequestMailer.send_patient_details_to_clinic(quote_request, clinic).deliver
        #TODO QuoteRequestMailer.send_patient_details(quote_request, clinic).deliver
    end
  end
end
