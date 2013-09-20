require 'spec_helper'

describe QuoteRequest do
  it { should belong_to(:user) }
  it { should validate_presence_of(:email) }

  context "when the submitter's account exists" do
    subject(:quote_request) { FactoryGirl.build(:new_quote_request, :email=>'existing-email-test@wakproductions.com') }
    let!(:existing_user) { FactoryGirl.create(:patient_user, :email=>'existing-email-test@wakproductions.com') }

    it 'can associate itself with the existing user account' do
      user_count = User.all.count
      expect {
        quote_request.find_or_create_user
      }.to change { quote_request.user_id }.from(nil).to(existing_user.id)
      User.all.count.should == user_count
    end
  end

  context "when the submitter's account does not exist" do
    subject(:quote_request) { FactoryGirl.build(:new_quote_request, :email=>'new-email-test@wakproductions.com') }

    it 'can automatically create a new patient user account' do
      user_count = User.all.count
      expect {
        quote_request.find_or_create_user
      }.to change { quote_request.user }.from(nil).to(be)
      User.all.count.should == user_count + 1
    end

  end
end