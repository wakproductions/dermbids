require 'spec_helper'

describe QuoteRequestsController do
  describe 'GET #new' do
    it 'populates @quote_requests' do
      get :new
      assigns(:quote_request).should be_new_record
    end

    it 'renders #new template' do
      get :new
      response.should render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new quote request' do
        expect {
          post :create, quote_request: FactoryGirl.attributes_for(:new_quote_request)
        }.to change(QuoteRequest, :count)
      end

      it 'renders #create template' do
        post :create, quote_request: FactoryGirl.attributes_for(:new_quote_request)
        response.should render_template :create
      end
    end

    context 'with invalid attributes'
  end

end