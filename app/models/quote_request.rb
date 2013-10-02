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

  # Calling this will generate the email that goes to the provider notifying that Dermbids is requesting a quote
  # TODO Replace this with 'request_quote_from_clinic', which generates a ClinicQuoteRequest record
  #def send_email_quote_request_to_provider(organization)
  #  QuoteRequestMailer.request_quote_from_provider(self, organization).deliver
  #end

end
