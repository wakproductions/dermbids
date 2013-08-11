class QuoteRequestsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only=>[:create]

  # POST /quote_requests
  # Is is the expectation that the form data will be posted here via a Formstack webhook after
  # a user submits a form through Formstack
  def create
    formstack_data = params.to_json
    QuoteRequest.create(:formstack_data=>formstack_data)
    head :ok
  end

end
