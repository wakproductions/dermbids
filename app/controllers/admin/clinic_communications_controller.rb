class Admin::ClinicCommunicationsController < ApplicationController
  #before_action :set_clinic_quote_request, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin_user!
  protect_from_forgery except: :create

  # POST admin/clinic_quote_requests
  # creates a new quote request to be sent to a specified clinic
  def create
    begin
      type = params[:type].to_i # should correspond to a ClinicCommuncation::COMMUNICATION_TYPES value
      clinic = Clinic.find(params[:clinic_id])
      quote_request = QuoteRequest.find(params[:quote_request_id])
    rescue
      render_400_error and return
    end

    case type
      when ClinicCommunication::COMMUNICATION_TYPES[:quote_request]
        quote_request.request_quote_from_clinic(clinic, current_user)
      when ClinicCommunication::COMMUNICATION_TYPES[:send_patient_details]
        quote_request.send_patient_details_to_clinic(clinic, current_user)
      else
        render_400_error and return
    end
    redirect_to admin_quote_request_path(quote_request)
  end

private
  def set_clinic_quote_requests
    @clinic_quote_request = Clinic.find(params[:id])
  end

  def organization_params
    params.require(:clinic_quote_request).permit(:quote_request_id, :clinic_id)
  end

end