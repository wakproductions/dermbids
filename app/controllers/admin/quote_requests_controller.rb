class Admin::QuoteRequestsController < AdminController
  before_action :authenticate_admin_user!
  before_action :set_quote_request, only: [:show, :update]

  # GET /admin/quote_requests
  def index
    @filter = filter_params  # so that we can highlight the currently selected view
    @quote_requests = QuoteRequest.filter(@filter)
  end

  # GET /admin/quote_requests/:id
  def show
    @clinics = Clinic.all # This will later be changed to encompass only clinics in the local area for this quote request
  end

  # PUT, PATCH /admin/quote_request/:id
  def update
    if @quote_request.update(quote_request_params)
      redirect_to admin_quote_request_path(@quote_request), notice: 'Status has been successfully updated.'
    else
      redirect_to admin_quote_request_path(@quote_request), notice: 'An error occurred updating the status of this quote request.'
    end
  end

private
  def filter_params
    if params.include? :filter
      params[:filter]
    else
      { status: :new }  # show only the new quote requests by default
    end
  end

  def set_quote_request
    @quote_request = QuoteRequest.find(params[:id])
  end

  def quote_request_params
    params.require(:quote_request).permit(:status)
  end

end
