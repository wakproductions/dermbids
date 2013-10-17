class QuoteRequestsController < ApplicationController
  # GET /quote_requests/new
  def new
    @quote_request = QuoteRequest.new
  end

  # GET /quote_requests
  def create
    @quote_request = QuoteRequest.new(quote_request_params)

    if @quote_request.save
      render :create
    else
      render :new
    end
  end

private
  def quote_request_params
    params.require(:quote_request).permit(:email, :full_name, :postal_code, :photo, :formstack_photo_url)
  end

#  All of the commented below haz been deprecated because we are no longer using Formstack
#
#  skip_before_filter :verify_authenticity_token, :only=>[:create]
#
#  # POST /formstack/quote_requests
#  # Is is the expectation that the form data will be posted here via a Formstack webhook after
#  # a user submits a form through Formstack
#  def create
#    formstack_data = params.to_json
#    qr = QuoteRequest.create(:formstack_data=>formstack_data)
#    tr = qr.tattoo_removal_requests.build(parse_tattoo_removal_request_attributes)
#    tr.save
#    head :ok
#  end
#
#
#private
#  FORMSTACK_MAPPINGS={
#      :"21100827"=>:colors,
#      :"21100837"=>:skin_tone,
#      :"21100821"=>:ink_age,
#      :"21100796"=>:image1_url,
#      :"21100896"=>:consultation_looking_reason,
#      :"21100847"=>:consultation_visit,
#      :"21100857"=>:first_name,
#      :"21100862"=>:referral,
#      #21100845: ,
#      :"21100860"=>:age,
#      :"21100861"=>:zip,
#      #21100866:
#      #21100806: Yes #this is the verification field that there is a ruler in image 1
#      :"21100801"=>:image2_url,
#      :"21100811"=>:location,
#      :"21100808"=>:reason,
#      :"21100816"=>:inked_by,
#      :"21100815"=>:size,
#      :"21100858"=>:email
#  }
#
#  def parse_tattoo_removal_request_attributes
#    h = Hash.new
#    params.each do |k,v|
#      if FORMSTACK_MAPPINGS[k.to_sym]
#        h[FORMSTACK_MAPPINGS[k.to_sym]] = v
#      end
#    end
#    return h
#  end
end
