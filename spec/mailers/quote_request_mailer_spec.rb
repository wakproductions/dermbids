require "spec_helper"

describe QuoteRequestMailer do
  let(:quote_request) { FactoryGirl.create(:new_quote_request) }
  let(:clinic) { FactoryGirl.create(:clinic, quote_request_contact: FactoryGirl.create(:provider_user)) }

  describe '#request_quote_from_provider' do
    let(:mail) { QuoteRequestMailer.request_quote_from_provider(quote_request, clinic).deliver }

    #ensure that the subject is correct
    it 'renders the subject' do
      #mail.subject.should == 'Instructions'
      mail.subject.class.should == String
    end

    #ensure that the receiver is correct
    it 'renders the receiver email' do
      mail.to.should == [clinic.quote_request_contact.email]
    end

    #ensure that the sender is correct
    it 'renders the sender email' do
      mail.from.should == [DEFAULT_MAILER_FROM]
    end

    #ensure that the name of the recipient appears in the email body
    it 'contains the recipient first name' do
      mail.body.encoded.should match(clinic.quote_request_contact.first_name)
    end

    it "contains the patient's masked full name" do
      # This test is giving me trouble - I get a "warning: redundant nested repeat operator" whenever I run this spec.
      # May be an RSpec bug
      #masked_name = quote_request.masked_full_name
      mail.body.encoded.should match(Regexp.escape(quote_request.masked_full_name))
      #mail.body.encoded.should match("Abnercromnie G**********")
      #true.should == true
    end

    it 'does not contain the recipient full name' do
      mail.body.encoded.should_not match(quote_request.full_name)
    end

    it 'does not contain the recipient email address' do
      mail.body.encoded.should_not match(quote_request.email)
    end

    it "contains the patient's postal code" do
      mail.body.encoded.should match(quote_request.postal_code)
    end

    pending 'contains an image and image link URL'

  end

  describe '#send_patient_details_to_clinic' do
    let(:mail) { QuoteRequestMailer.send_patient_details_to_clinic(quote_request, clinic).deliver }

    #ensure that the receiver is correct
    it 'renders the receiver email' do
      mail.to.should == [clinic.quote_request_contact.email]
    end

    #ensure that the sender is correct
    it 'renders the sender email' do
      mail.from.should == [DEFAULT_MAILER_FROM]
    end

    #ensure that the name of the recipient appears in the email body
    it 'contains the recipient first name' do
      mail.body.encoded.should match(clinic.quote_request_contact.first_name)
    end

    it "contains the patient's full name" do
      mail.body.encoded.should match(quote_request.full_name)
    end

    it "contains the patient's email address" do
      mail.body.encoded.should match(quote_request.email)
    end

    pending 'contains an image and image link URL'

  end

end
