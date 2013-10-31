class Admin::QuoteRequestsController < AdminController
  before_action :authenticate_admin_user!

  # GET /admin/quote_requests
  def index
    @filter = filter_params  # so that we can highlight the currently selected view
    @quote_requests = QuoteRequest.filter(@filter)
  end

  # GET /admin/quote_requests/:id
  def show
    @quote_request = QuoteRequest.find(params[:id])
    @clinics = Clinic.all # This will later be changed to encompass only clinics in the local area for this quote request
  end

private
  def filter_params
    if params.include? :filter
      params[:filter]
    else
      { status: :new }  # show only the new quote requests by default
    end
  end

end
