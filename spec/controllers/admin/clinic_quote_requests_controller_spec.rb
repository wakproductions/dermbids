require 'spec_helper'
require 'helpers/devise_helpers'

describe Admin::ClinicQuoteRequestsController do
  after(:each) { Warden.test_reset! }

  describe 'POST #create' do
    let(:admin_user) { FactoryGirl.create(:admin_user) }
    let(:provider_user) { FactoryGirl.create(:provider_user) }
    let(:quote_request) { FactoryGirl.create(:new_quote_request) }
    let(:clinic) { FactoryGirl.create(:clinic, quote_request_contact: provider_user) }

    context 'with valid attributes' do
      it 'creates a new quote request' do
        expect {
          as_admin(admin_user).post :create, quote_request_id: quote_request, clinic_id: clinic
        }.to change(ClinicQuoteRequest, :count)
      end

      it 'redirects to QuoteRequest#show' do
        as_admin(admin_user).post :create, quote_request_id: quote_request, clinic_id: clinic
        response.should redirect_to admin_quote_request_path(quote_request)
      end

      context 'as not admin' do
        it 'denies access' do
          as_patient.post :create, quote_request: FactoryGirl.attributes_for(:new_quote_request), clinic: clinic
          response.status.should_not eq(200)
        end
      end
    end

    context 'with invalid attributes' do
      it 'renders bad request for invalid quote request id' do
        as_admin(admin_user).post :create, quote_request_id: 999999, clinic_id: clinic
        response.status.should eq(400)
      end
    end

  end
end