require 'spec_helper'
require 'helpers/devise_helpers'

describe Admin::QuoteRequestsController do
  after(:each) { Warden.test_reset! }
  it 'only allows admins to access this section' do
    as_admin(FactoryGirl.create(:admin_user)).get :index
    response.should render_template :index
  end
  it 'blocks non admin from accessing this section' do
    as_patient(FactoryGirl.create(:patient_user)).get :index
    response.should_not render_template :index
    response.should redirect_to new_user_session_path
  end

  let(:quote_requests) {
    [
        FactoryGirl.create(:new_quote_request),
        FactoryGirl.create(:new_quote_request, email: 'james.kirk@starfleet.org', full_name: 'James T Kirk'),
        FactoryGirl.create(:new_quote_request, email: 'spock@starfleet.org', full_name: 'Spock'),
        FactoryGirl.create(:new_quote_request, email: 'montgomery.scott@starfleet.org', full_name: 'Scotty')
    ]
  }

  describe 'GET #index' do
    before { as_admin(FactoryGirl.create(:admin_user)).get :index }
    it { assigns(:quote_requests).should eq(quote_requests) }
    it { response.should render_template :index }
  end

  describe 'GET #show' do
    before { as_admin(FactoryGirl.create(:admin_user)).get :show, id: quote_requests.first.id }
    let(:organizations) { [FactoryGirl.create(:organization), FactoryGirl.create(:organization)] } # create 2 organizations in the database

    it { assigns(:quote_request).should eq(quote_requests.first) }
    it { assigns(:organizations).should eq(organizations) }
    it { response.should render_template :show }
  end

end
