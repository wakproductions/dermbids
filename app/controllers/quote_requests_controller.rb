class QuoteRequestsController < ApplicationController
  # GET /quote_requests/new
  def new
    @quote_request = QuoteRequest.new
  end

  # GET /quote_requests
  def create
    @quote_request = QuoteRequest.new(quote_request_params)

    if @quote_request.save
      render :create
    else
      render :new
    end
  end

private
  def quote_request_params
    params.require(:quote_request).permit(:email, :full_name, :postal_code, :photo, :formstack_photo_url)
  end
end
