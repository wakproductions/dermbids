class QuoteRequest < ActiveRecord::Base
  belongs_to :user
  has_many :clinic_communications

  validates :email, presence: true

  ###### BEGIN Paperclip related settings #####
  has_attached_file :photo,
    storage: :s3,
    s3_credentials: {
        access_key_id: ENV['AMAZON_ACCESS_KEY_ID'],
        secret_access_key: ENV['AMAZON_SECRET_ACCESS_KEY'],
        bucket: 'dermbids_development' #TODO change this to an environment variable
    },
    styles: { size320: '320' },
    path: '/:style/:hash.:extension',
    hash_secret: ENV['DERMBIDS_PHOTO_HASH_SECRET'],
    hash_data: ':class/:attachment/:id/:style/'

  validates :photo, attachment_presence: true
  validates :photo, attachment_size: { less_than: 15.megabytes }
  validates :photo, attachment_content_type: { content_type: ['image/png', 'image/gif', 'image/jpg', 'image/jpeg'] }
  ###### Paperclip related settings END #####


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
