class QuoteRequest < ActiveRecord::Base
  belongs_to :user
  has_many :clinic_communications

  validates :email, presence: true

  def find_or_create_user
    self.user = User.find_or_create_by(email: self.email) if user.nil? && self.email.present?
  end

  def masked_full_name
    full_name[/(\w*\s.|\w*)/] + '**********'
  end

  # Creates a ClinicCommunication object to log the fact that a quote request was sent to the given clinic
  def request_quote_from_clinic(clinic, initiated_by_user=nil)
    clinic_communication=self.clinic_communications.create(
        initiated_by_user: initiated_by_user,  # this will normally be current_user
        communication_type: ClinicCommunication::COMMUNICATION_TYPES[:quote_request],
        clinic: clinic,
        quote_request: self
    )
    clinic_communication.send_email_to_clinic # TODO this may have to be refactored to become thread safe
    return clinic_communication
  end

  #TODO Consider refactoring to combine with request_quote_from_clinic - a new method called #send_clinic_communication(*args)?
  def send_patient_details_to_clinic(clinic, initiated_by_user=nil)
    clinic_communication=self.clinic_communications.create(
        initiated_by_user: initiated_by_user,  # this will normally be current_user
        communication_type: ClinicCommunication::COMMUNICATION_TYPES[:send_patient_details],
        clinic: clinic,
        quote_request: self
    )
    clinic_communication.send_email_to_clinic # TODO this may have to be refactored to become thread safe
    return clinic_communication
  end

end
