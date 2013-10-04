class QuoteRequest < ActiveRecord::Base
  belongs_to :user
  has_many :clinic_quote_requests

  validates :email, presence: true

  def find_or_create_user
    self.user = User.find_or_create_by(email: self.email) if user.nil? && self.email.present?
  end

  def masked_full_name
    full_name[/(\w*\s.|\w*)/] + '**********'
  end

  # Creates a ClinicQuoteRequest object to log the fact that a quote request was sent to the given clinic
  def request_quote_from_clinic(clinic, initiated_by_user=nil)
    cqr=self.clinic_quote_requests.create(
        initiated_by_user: initiated_by_user,  # this will normally be current_user
        clinic: clinic,
        quote_request: self
    )
    cqr.send_email_to_clinic # TODO this may have to be refactored to become thread safe
    return cqr
  end

end
