require 'spec_helper'
require 'paperclip/attachment'
include ActionDispatch::TestProcess

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
        #stub_paperclip_s3("QuoteRequest", "photo", ".jpg")
        QuoteRequest.stub(:save_attached_files).and_return(true)
        #QuoteRequest.stub(:photo_file_name).and_return("a_photo.jpg")
        #QuoteRequest.stub(:photo_content_type).and_return('image/jpeg')
        #QuoteRequest.stub(:photo_file_size).and_return(1024)
        #QuoteRequest.stub(:photo_updated_at).and_return(Time.now)


        expect {
          post :create,
               quote_request:
                   FactoryGirl.attributes_for(:new_quote_request).merge(
                   photo: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/files/sample_tattoo_01.jpg'), 'image/jpeg')
                   )
        }.to change(QuoteRequest, :count)
      end

      it 'renders #create template' do
        QuoteRequest.stub(:save_attached_files).and_return(true)
        post :create,
             quote_request:
                 FactoryGirl.attributes_for(:new_quote_request).merge(
                     photo: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/files/sample_tattoo_01.jpg'), 'image/jpeg')
                 )
        response.should render_template :create
      end
    end

    context 'with invalid attributes'
  end

end