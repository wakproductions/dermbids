require 'spec_helper'

describe Clinic do
  it { should belong_to(:quote_request_contact) }

  let(:provider_user) { FactoryGirl.create(:provider_user) }
  subject(:clinic) { FactoryGirl.create(:clinic, quote_request_contact: provider_user) }

  its(:quote_request_contact) { should_not be_nil }
end