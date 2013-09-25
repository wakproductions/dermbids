require 'spec_helper'

describe "organizations/index" do
  before(:each) do
    assign(:organizations, [
      stub_model(Organization,
        :business_name => "Business Name",
        :address1 => "Address1",
        :address2 => "Address2",
        :city => "City",
        :state => 1,
        :postal_code => "Postal Code"
      ),
      stub_model(Organization,
        :business_name => "Business Name",
        :address1 => "Address1",
        :address2 => "Address2",
        :city => "City",
        :state => 1,
        :postal_code => "Postal Code"
      )
    ])
  end

  it "renders a list of organizations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Business Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address1".to_s, :count => 2
    assert_select "tr>td", :text => "Address2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Postal Code".to_s, :count => 2
  end
end
