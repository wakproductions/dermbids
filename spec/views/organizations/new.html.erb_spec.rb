#require 'spec_helper'
#
#describe "clinics/new" do
#  before(:each) do
#    assign(:organization, stub_model(Clinic,
#      :business_name => "MyString",
#      :address1 => "MyString",
#      :address2 => "MyString",
#      :city => "MyString",
#      :state => 1,
#      :postal_code => "MyString"
#    ).as_new_record)
#  end
#
#  it "renders new organization form" do
#    render
#
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    assert_select "form[action=?][method=?]", organizations_path, "post" do
#      assert_select "input#organization_business_name[name=?]", "organization[business_name]"
#      assert_select "input#organization_address1[name=?]", "organization[address1]"
#      assert_select "input#organization_address2[name=?]", "organization[address2]"
#      assert_select "input#organization_city[name=?]", "organization[city]"
#      assert_select "input#organization_state[name=?]", "organization[state]"
#      assert_select "input#organization_postal_code[name=?]", "organization[postal_code]"
#    end
#  end
#end
