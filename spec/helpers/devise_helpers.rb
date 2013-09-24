require 'spec_helper'
include Warden::Test::Helpers
include Devise::TestHelpers
Warden.test_mode!

def as_patient(user=nil, &block)
  current_user = user || Factory.create(:patient_user)
  if request.present?
    sign_in(current_user)
  else
    login_as(current_user, :scope => :user)
  end
  block.call if block.present?
  return self
end

def as_admin(user=nil, &block)
  current_user = user || Factory.create(:admin_user)
  if request.present?
    sign_in(current_user)
  else
    login_as(current_user, :scope => :user)
  end
  block.call if block.present?
  return self
end

def as_provider

end

def as_visitor(user=nil, &block)
  current_user = user || Factory.stub(:user)
  if request.present?
    sign_out(current_user)
  else
    logout(:user)
  end
  block.call if block.present?
  return self
end