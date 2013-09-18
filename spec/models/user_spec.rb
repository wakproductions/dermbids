require 'spec_helper'

describe User do
  its(:email) { should be_present }

end