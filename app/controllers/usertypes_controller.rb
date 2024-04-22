class UsertypesController < ApplicationController
  before_action :must_login
  before_action :set_usertype, only: %i[ show edit update destroy ]

  # GET /usertypes or /usertypes.json
  def index
    if params[:search]
      @usertypes = Usertype.search(params[:search], params[:page])
    else
      @usertypes = Usertype.paginate(:page => params[:page], per_page: 5)
    end
  end

  # GET /usertypes/1 or /usertypes/1.json
  def show
  end

  # GET /usertypes/new
  def new
    @usertype = Usertype.new
  end

  # GET /usertypes/1/edit
  def edit
  end

  # POST /usertypes or /usertypes.json
  def create
    @usertype = Usertype.new(usertype_params)

    respond_to do |format|
      if @usertype.save
        format.html { redirect_to usertype_url(@usertype), notice: "Usertype was successfully created." }
        format.json { render :show, status: :created, location: @usertype }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @usertype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usertypes/1 or /usertypes/1.json
  def update
    respond_to do |format|
      if @usertype.update(usertype_params)
        format.html { redirect_to usertype_url(@usertype), notice: "Usertype was successfully updated." }
        format.json { render :show, status: :ok, location: @usertype }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @usertype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usertypes/1 or /usertypes/1.json
  def destroy
    @usertype.destroy

    respond_to do |format|
      format.html { redirect_to usertypes_url, notice: "Usertype was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usertype
      @usertype = Usertype.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def usertype_params
      params.require(:usertype).permit(:name, :search, :page)
    end
end
