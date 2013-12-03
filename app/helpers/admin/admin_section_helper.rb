module Admin::AdminSectionHelper
  def status_filter_name
    @filter[:status].to_s.capitalize
  end

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

  def city_from_zip_code(zip)
    begin
      zip.to_region || "Unknown City"
    rescue
      "Unknown City"
    end
  end

  def tattoo_removal_estimates_email_body_for_patient
   <<END
Hi #{@quote_request.first_name},

There are _____ tattoo removal providers in the #{city_from_zip_code(@quote_request.postal_code)} area interested in removing your tattoo! There are ___ providers in the area providing the r20 method. We did provide you a PicoSure estimate.



Download the side by side comparison of the service providers at bit.ly Go to "File" then "Download".



Want a lower price?
DermBids will pay you $15 each time you have a tattoo removal treatment! All you need to do is write us an article! We and our readers want you to document and share your experience using DermBids and keep us informed on how the overall tattoo removal process is progressing. Let us know if you are interested in learning more!


Example 1: http://www.dermbids.com/vamoose-tattoo-removal-chicago-update-1-mark-e/

Example 2: http://www.dermbids.com/tattoo-removal-update-1-saruhhfaaceee/

Next Steps:
1.) Download and review the side by side comparison (see link above).
2.) Feel free to ask DermBids any questions.
3.) Schedule your visit directly with the service provider or directly with DermBids. If you schedule directly with the provider, give us a heads up so we can ensure everything runs smoothly.
4.) You redeem your $15 discount per treatment when we receive your article.

Please let me know if you have any questions and please keep us updated if you decide to remove your tattoo!


Thanks,
Eric
END
  end

  def tattoo_removal_estimates_followup_email_body_for_patient
    <<END
Hi #{@quote_request.first_name},

I wanted to follow up with you about the tattoo removal estimates I sent you. Do you like one provider over another?

Please let me know if you have any questions!

Eric
END
  end


end
