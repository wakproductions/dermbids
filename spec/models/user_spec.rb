require 'spec_helper'

describe User do
  it {should have_many(:quote_requests)}

  subject(:patient_user) { FactoryGirl.create(:patient_user) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:user_type) }

  it 'should default to a type of patient' do
    User.new.user_type.should eq(User::TYPES[:patient])
  end

  it 'should generate a random 10-char password upon creation' do
    User.new.password.should_not be_nil
  end

end