class Admin::QuoteRequestsController < ApplicationController
  # GET /admin/quote_requests
  def index
    @quote_requests = QuoteRequest.all
  end
end
