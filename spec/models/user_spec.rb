require 'spec_helper'

describe User do
  it { should have_many(:clinics).with_foreign_key(:quote_request_contact_user_id) }
  it { should have_many(:clinic_communications).with_foreign_key(:initiated_by_user_id) }

  subject(:patient_user) { FactoryGirl.create(:patient_user) }

  it 'should default to a type of patient' do
    User.new.user_type.should eq(User::TYPES[:patient])
  end

  it 'should generate a random 10-char password upon creation' do
    User.new.password.should_not be_nil
  end

end