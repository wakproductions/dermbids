module QuoteRequestsHelper
  def status_filter_name
    @filter[:status].to_s.capitalize
  end
end
