require 'spec_helper'

describe User do
  it {should have_many(:quote_requests)}


  subject(:patient_user) { FactoryGirl.create(:patient_user) }
  its(:email) { should be_present }
  it 'should not be valid without an email' do
    should be_valid
    subject.email=nil
    should_not be_valid
  end

  it 'should generate a random password upon creation' do
    new_user=FactoryGirl.create(:no_password_user)
    new_user.password.should_not be_nil
    new_user.should be_valid
  end

end