class ClinicQuoteRequest < ActiveRecord::Base
  belongs_to :initiated_by_user, class_name: 'User', foreign_key: :initiated_by_user_id
  belongs_to :clinic
  belongs_to :quote_request

  validates_presence_of :clinic
  validates_presence_of :quote_request

  def send_email_to_clinic
    QuoteRequestMailer.request_quote_from_provider(quote_request, clinic).deliver
  end
end
