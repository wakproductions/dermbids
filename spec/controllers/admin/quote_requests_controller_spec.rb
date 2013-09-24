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

  describe 'GET #index' do
    let(:quote_requests) {
      [
          FactoryGirl.create(:new_quote_request),
          FactoryGirl.create(:new_quote_request, email: 'james.kirk@starfleet.org', full_name: 'James T Kirk'),
          FactoryGirl.create(:new_quote_request, email: 'spock@starfleet.org', full_name: 'Spock'),
          FactoryGirl.create(:new_quote_request, email: 'montgomery.scott@starfleet.org', full_name: 'Scotty')
      ]
    }
    before { as_admin(FactoryGirl.create(:admin_user)).get :index }

    it 'shows a list of quote requests' do
      assigns(:quote_requests).should eq(quote_requests)
    end

    it { response.should render_template :index }
  end

end
