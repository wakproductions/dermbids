require 'spec_helper'

describe QuoteRequest do
  subject(:new_quote_request) { FactoryGirl.build(:new_quote_request) }
  it { should have_many :clinic_communications }
  it { should validate_presence_of :email }

  # Photo attachment related
  it { should have_attached_file(:photo) }
  it { should validate_attachment_presence(:photo) }
  it { should validate_attachment_size(:photo).less_than(15.megabytes) }
  it { should validate_attachment_content_type(:photo)
              .allowing('image/png', 'image/gif', 'image/jpg', 'image/jpeg')
              .rejecting('text/plain', 'text/xml') }


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


  describe '#request_quote_from_clinic' do
    subject(:new_quote_request) { FactoryGirl.create(:new_quote_request) }
    let(:clinic) { FactoryGirl.create(:clinic, quote_request_contact: FactoryGirl.create(:provider_user))}
    let(:current_admin_user) { FactoryGirl.create(:admin_user) }

    it 'sets the properties of the ClinicCommunication object' do
      clinic_communication = new_quote_request.request_quote_from_clinic(clinic, current_admin_user)
      clinic_communication.communication_type.should == ClinicCommunication::COMMUNICATION_TYPES[:quote_request]
      clinic_communication.clinic.should == clinic
      clinic_communication.initiated_by_user.should == current_admin_user
    end

    it 'sends email request to clinic' do
      cqr_count = ClinicCommunication.all.count
      clinic_communication = new_quote_request.request_quote_from_clinic(clinic, current_admin_user)
      ClinicCommunication.all.count.should == cqr_count+1
      ActionMailer::Base.deliveries.last.to.should == [clinic.quote_request_contact.email]
    end

    it 'changes ClinicCommunication count' do
      cqr_count = ClinicCommunication.all.count
      clinic_communication = new_quote_request.request_quote_from_clinic(clinic, current_admin_user)
      ClinicCommunication.all.count.should == cqr_count+1
    end

  end

  describe '#request_quote_from_clinic' do
    subject(:new_quote_request) { FactoryGirl.create(:new_quote_request) }
    let(:clinic) { FactoryGirl.create(:clinic, quote_request_contact: FactoryGirl.create(:provider_user))}
    let(:current_admin_user) { FactoryGirl.create(:admin_user) }

    it 'sets the properties of the ClinicCommunication object' do
      clinic_communication = new_quote_request.request_quote_from_clinic(clinic, current_admin_user)
      clinic_communication.communication_type.should == ClinicCommunication::COMMUNICATION_TYPES[:quote_request]
      clinic_communication.clinic.should == clinic
      clinic_communication.initiated_by_user.should == current_admin_user
    end

    it 'sends email request to clinic' do
      clinic_communication = new_quote_request.request_quote_from_clinic(clinic, current_admin_user)
      ActionMailer::Base.deliveries.last.to.should == [clinic.quote_request_contact.email]
    end

    it 'changes ClinicCommunication count' do
      cqr_count = ClinicCommunication.all.count
      clinic_communication = new_quote_request.request_quote_from_clinic(clinic, current_admin_user)
      ClinicCommunication.all.count.should == cqr_count+1
    end

  end

  describe '#send_patient_details_to_clinic' do
    subject(:new_quote_request) { FactoryGirl.create(:new_quote_request) }
    let(:clinic) { FactoryGirl.create(:clinic, quote_request_contact: FactoryGirl.create(:provider_user))}
    let(:current_admin_user) { FactoryGirl.create(:admin_user) }

    it 'sets the properties of the ClinicCommunication object' do
      clinic_communication = new_quote_request.send_patient_details_to_clinic(clinic, current_admin_user)
      clinic_communication.communication_type.should == ClinicCommunication::COMMUNICATION_TYPES[:send_patient_details]
      clinic_communication.clinic.should == clinic
      clinic_communication.initiated_by_user.should == current_admin_user
    end

    it 'sends email request to clinic' do
      clinic_communication = new_quote_request.send_patient_details_to_clinic(clinic, current_admin_user)
      ActionMailer::Base.deliveries.last.to.should == [clinic.quote_request_contact.email]
    end

    it 'changes ClinicCommunication count' do
      cqr_count = ClinicCommunication.all.count
      clinic_communication = new_quote_request.send_patient_details_to_clinic(clinic, current_admin_user)
      ClinicCommunication.all.count.should == cqr_count+1
    end

  end
end