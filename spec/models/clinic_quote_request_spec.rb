require 'spec_helper'

describe ClinicQuoteRequest do
  let(:admin_user) { FactoryGirl.create(:admin_user) }
  let(:quote_request) { FactoryGirl.create(:new_quote_request) }
  let(:clinic) { FactoryGirl.create(:clinic) }
  subject(:clinic_quote_request) do
    FactoryGirl.create(:clinic_quote_request,
                       initiated_by_user: admin_user,
                       quote_request: quote_request,
                       clinic: clinic)
  end

  it { should belong_to :quote_request }
  it { should belong_to :clinic }
  it { should belong_to(:initiated_by_user).class_name(:User) }

  its(:initiated_by_user) { should be_present }
  its(:clinic) { should be_present }
  its(:quote_request) { should be_present }

  pending '#send_email_to_clinic'
end
