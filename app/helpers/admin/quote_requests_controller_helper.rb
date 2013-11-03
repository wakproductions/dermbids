module Admin::QuoteRequestsControllerHelper
  def current_status_button
    button_class = case QuoteRequest::STATUS.key(@quote_request.status)
                     when :new then "btn-warning"
                     when :active then "btn-success"
                     when :archived then "btn-default"
                     when :revisit then "btn-default"
                   end

    haml_tag :button, :class=>"btn btn-default dropdown-toggle #{button_class}", :type=>"button", :"data-toggle"=>"dropdown" do
      haml_concat QuoteRequest::STATUS.key(@quote_request.status).capitalize
      haml_tag :span, :class=>"caret"
    end
  end

end
