class TattooRemovalRequestsController < ApplicationController
  before_action :set_tattoo_removal_request, only: [:show, :edit, :update, :destroy]

  # GET /tattoo_removal_requests
  # GET /tattoo_removal_requests.json
  def index
    @tattoo_removal_requests = TattooRemovalRequest.all
  end

  # GET /tattoo_removal_requests/1
  # GET /tattoo_removal_requests/1.json
  def show
  end

  # GET /tattoo_removal_requests/new
  def new
    @tattoo_removal_request = TattooRemovalRequest.new
  end

  # GET /tattoo_removal_requests/1/edit
  def edit
  end

  # POST /tattoo_removal_requests
  # POST /tattoo_removal_requests.json
  def create
    @tattoo_removal_request = TattooRemovalRequest.new(tattoo_removal_request_params)

    respond_to do |format|
      if @tattoo_removal_request.save
        format.html { redirect_to @tattoo_removal_request, notice: 'Tattoo removal request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tattoo_removal_request }
      else
        format.html { render action: 'new' }
        format.json { render json: @tattoo_removal_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tattoo_removal_requests/1
  # PATCH/PUT /tattoo_removal_requests/1.json
  def update
    respond_to do |format|
      if @tattoo_removal_request.update(tattoo_removal_request_params)
        format.html { redirect_to @tattoo_removal_request, notice: 'Tattoo removal request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tattoo_removal_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tattoo_removal_requests/1
  # DELETE /tattoo_removal_requests/1.json
  def destroy
    @tattoo_removal_request.destroy
    respond_to do |format|
      format.html { redirect_to tattoo_removal_requests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tattoo_removal_request
      @tattoo_removal_request = TattooRemovalRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tattoo_removal_request_params
      params.require(:tattoo_removal_request).permit(:image1_url, :image2_url, :reason, :location, :size, :inked_by, :ink_age, :colors, :skin_tone, :consultation_visit, :consultation_looking_reason_string, :first_name, :last_name, :email, :age, :zip, :referral)
    end
end
