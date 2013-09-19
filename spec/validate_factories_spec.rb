require 'spec_helper'

# The below code is intended to validate the factories. To run it, do from the command line:
# $rspec spec/validate_factories_spec.rb
#
# Doing so will find any Factories that are invalid upon creation

describe 'validate FactoryGirl factories' do
  FactoryGirl.factories.each do |factory|
    context "with factory for :#{factory.name}" do
      subject { FactoryGirl.build(factory.name) }

      it "is valid" do
        is_valid = subject.valid?
        is_valid.should be_true, subject.errors.full_messages.join(',')
      end
    end
  end
end