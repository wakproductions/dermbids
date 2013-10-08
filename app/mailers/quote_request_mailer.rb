class QuoteRequestMailer < ActionMailer::Base
  default from: DEFAULT_MAILER_FROM

  def request_quote_from_provider(quote_request, clinic)
    @clinic = clinic
    @quote_request = quote_request
    mail to: clinic.quote_request_contact.email, subject: 'New quote request from Dermbids'
  end

  def send_patient_details_to_clinic(quote_request, clinic)
    @clinic = clinic
    @quote_request = quote_request
    mail to: clinic.quote_request_contact.email, subject: "Dermbids Patient Referral: Tattoo Removal Contact for #{quote_request.full_name}"
  end
end
