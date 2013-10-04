require 'spec_helper'

describe QuoteRequest do
  subject(:new_quote_request) { FactoryGirl.build(:new_quote_request) }
  it { should have_many :clinic_quote_requests }
  it { should validate_presence_of :email }


  describe '#masked_full_name' do
    req = FactoryGirl.build(:new_quote_request, full_name: 'James T. Kirk')
    req.masked_full_name.should == 'James T**********' # should be first name followed by 10 asterisks

    req.full_name = 'Hikaru Sulu'
    req.masked_full_name.should == 'Hikaru S**********'

    req.full_name = 'Spock'
    req.masked_full_name.should == 'Spock**********'
  end


  describe 'automatically associates with a User' do
    context "when the submitter's account exists" do
      subject(:quote_request) { FactoryGirl.build(:new_quote_request, :email=>'existing-email-test@wakproductions.com') }
      let!(:existing_user) { FactoryGirl.create(:patient_user, :email=>'existing-email-test@wakproductions.com') }

      it 'associates with an existing user account' do
        user_count = User.all.count
        expect {
          quote_request.find_or_create_user
        }.to change { quote_request.user_id }.from(nil).to(existing_user.id)
        User.all.count.should == user_count
      end
    end

    context "when the submitter's account does not exist" do
      subject(:quote_request) { FactoryGirl.build(:new_quote_request, :email=>'new-email-test@wakproductions.com') }

      it 'creates a new patient user account' do
        user_count = User.all.count
        expect {
          quote_request.find_or_create_user
        }.to change { quote_request.user }.from(nil).to(be)
        User.all.count.should == user_count + 1
      end
    end
  end


  describe 'sends a quote request email query to clinic' do
    subject(:new_quote_request) { FactoryGirl.create(:new_quote_request) }
    let(:clinic) { FactoryGirl.create(:clinic, quote_request_contact: FactoryGirl.create(:provider_user))}
    let(:current_admin_user) { FactoryGirl.create(:admin_user) }

    it '#request_quote_from_clinic' do
      cqr_count = ClinicQuoteRequest.all.count
      clinic_quote_request = new_quote_request.request_quote_from_clinic(clinic, current_admin_user)
      ClinicQuoteRequest.all.count.should == cqr_count+1
      clinic_quote_request.clinic.should == clinic
      clinic_quote_request.initiated_by_user.should == current_admin_user
      ActionMailer::Base.deliveries.last.to.should == [clinic.quote_request_contact.email]
    end
  end
end