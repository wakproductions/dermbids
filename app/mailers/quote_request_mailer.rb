class QuoteRequestMailer < ActionMailer::Base
  default from: DEFAULT_MAILER_FROM

  def request_quote_from_provider(quote_request, organization)
    @organization = organization
    @quote_request = quote_request
    mail to: organization.quote_request_contact.email, subject: 'New quote request from Dermbids'
  end
end
