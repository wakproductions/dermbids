class Admin::QuoteRequestsController < ApplicationController
  before_action :authenticate_admin_user!

  # GET /admin/quote_requests
  def index
    @quote_requests = QuoteRequest.all
  end

  # GET /admin/quote_requests/:id
  def show
    @quote_request = QuoteRequest.find(params[:id])
  end

end
