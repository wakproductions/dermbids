require 'spec_helper'

describe ClinicQuoteRequest do
  let(:admin_user) { FactoryGirl.create(:admin_user) }
  let(:provider_user) { FactoryGirl.create(:provider_user)}
  let(:quote_request) { FactoryGirl.create(:new_quote_request) }
  let(:clinic) { FactoryGirl.create(:clinic, quote_request_contact: provider_user) }
  subject(:clinic_quote_request) {
    FactoryGirl.build(:clinic_quote_request,
                       initiated_by_user: admin_user,
                       quote_request: quote_request,
                       clinic: clinic)
  }

  it { should belong_to(:initiated_by_user).class_name(:User) }
  it { should belong_to :clinic }
  it { should belong_to :quote_request }

  it { should validate_presence_of :clinic }
  it { should validate_presence_of :quote_request}

  its(:initiated_by_user) { should be_present }
  its(:clinic) { should be_present }
  its(:quote_request) { should be_present }

  describe '#send_email_to_clinic' do
    it "sends an email to the clinic's contact" do
      clinic_quote_request.send_email_to_clinic
      ActionMailer::Base.deliveries.last.to.should == [clinic_quote_request.clinic.quote_request_contact.email]
    end
  end
end
