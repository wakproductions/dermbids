require 'spec_helper'

describe Organization do
  let(:provider_user) { FactoryGirl.create(:provider_user) }
  subject(:organization) { FactoryGirl.create(:organization, quote_request_contact: provider_user) }

  its(:quote_request_contact) { should_not be_nil }
end