class QuoteRequestsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only=>[:create]

  # POST /quote_requests
  def create
    formstack_data = params.to_json
    QuoteRequest.create(:formstack_data=>formstack_data)
    render nothing: true
  end

end
