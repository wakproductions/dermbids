require 'spec_helper'

describe QuoteRequest do
  context "when the submitter's account exists" do
    subject(:quote_request) { FactoryGirl.build(:new_quote_request, :email=>'existing-email-test@wakproductions.com') }
    let(:existing_user) { FactoryGirl.create(:patient_user, :email=>'existing-email-test@wakproductions.com') }

    # check the record count of users to make sure it didn't just create a new account
    it 'associates itself with the existing user account' do
      expect {
        quote_request.find_or_create_patient_user_id
      }.to change { quote_request.patient_user_id.id }.from(nil).to(existing_user.id)
    end
  end

  context "when the submitter's account does not exist" do
    # check the users table record count
    it 'automatically creates a new patient user account'

  end
end