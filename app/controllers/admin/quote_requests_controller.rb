class Admin::QuoteRequestsController < ApplicationController
  before_action :authenticate_admin_user!

  # GET /admin/quote_requests
  def index
    @quote_requests = QuoteRequest.all
  end

end
