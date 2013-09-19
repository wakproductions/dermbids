require 'spec_helper'

describe User do
  subject(:patient_user) { FactoryGirl.create(:patient_user) }
  its(:email) { should be_present }
  it 'should not be valid without an email' do
    should be_valid
    subject.email=nil
    should_not be_valid
  end

end