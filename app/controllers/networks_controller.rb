class NetworksController < ApplicationController
  before_action :must_login
  before_action :set_network, only: %i[ show edit update destroy ]

  # GET /networks or /networks.json
  def index
    if params[:search]
      @networks = Network.search(params[:search], params[:a_id], params[:page])
    else
      @networks = Network.paginate(:page => params[:page], per_page: 5)
    end
    @accounts = Account.all
  end

  # GET /networks/1 or /networks/1.json
  def show
  end

  # GET /networks/new
  def new
    @network = Network.new
  end

  # GET /networks/1/edit
  def edit
  end

  # POST /networks or /networks.json
  def create
    @network = Network.new(network_params)

    respond_to do |format|
      if @network.save
        format.html { redirect_to network_url(@network), notice: "Network was successfully created." }
        format.json { render :show, status: :created, location: @network }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @network.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /networks/1 or /networks/1.json
  def update
    respond_to do |format|
      if @network.update(network_params)
        format.html { redirect_to network_url(@network), notice: "Network was successfully updated." }
        format.json { render :show, status: :ok, location: @network }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @network.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /networks/1 or /networks/1.json
  def destroy
    @network.destroy

    respond_to do |format|
      format.html { redirect_to networks_url, notice: "Network was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_network
      @network = Network.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def network_params
      params.require(:network).permit(:name, :account_id, :search, :a_id, :page)
    end
end
