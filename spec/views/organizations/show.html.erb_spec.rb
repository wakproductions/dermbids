#require 'spec_helper'
#
#describe "clinics/show" do
#  before(:each) do
#    @organization = assign(:organization, stub_model(Clinic,
#      :business_name => "Business Name",
#      :address1 => "Address1",
#      :address2 => "Address2",
#      :city => "City",
#      :state => 1,
#      :postal_code => "Postal Code"
#    ))
#  end
#
#  it "renders attributes in <p>" do
#    render
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    rendered.should match(/Business Name/)
#    rendered.should match(/Address1/)
#    rendered.should match(/Address2/)
#    rendered.should match(/City/)
#    rendered.should match(/1/)
#    rendered.should match(/Postal Code/)
#  end
#end
