require 'spec_helper'

describe Admin::QuoteRequestsController do
  describe 'GET #index' do
    let(:quote_requests) {
      [
          FactoryGirl.create(:new_quote_request),
          FactoryGirl.create(:new_quote_request, email: 'james.kirk@starfleet.org', full_name: 'James T Kirk'),
          FactoryGirl.create(:new_quote_request, email: 'spock@starfleet.org', full_name: 'Spock'),
          FactoryGirl.create(:new_quote_request, email: 'montgomery.scott@starfleet.org', full_name: 'Scotty')
      ]
    }
    before { get :index }

    it 'shows a list of quote requests' do
      assigns(:quote_requests).should eq(quote_requests)
    end

    it { response.should render_template :index }
  end

end
