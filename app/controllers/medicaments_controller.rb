class MedicamentsController < ApplicationController
  before_action :set_medicament, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :destroy]

  # GET /medicaments
  def index
    @medicaments = Medicament.all
  end

  # GET /medicaments/1
  def show
    if params[:search]
      @medicament = Medicament.search(params[:search]).order("created_at DESC").first
    else
      @medicament = Medicament.find(params[:id])
    end
    @hash = Gmaps4rails.build_markers(@medicament.drugstores) do |drugstore, marker|
      marker.lat drugstore.latitude
      marker.lng drugstore.longitude
      marker.json({ title: drugstore.name, id: drugstore.id })
      marker.infowindow render_to_string(:partial => "/drugstores/map_box", locals: {drugstore: drugstore})
    end
  end

  # GET /medicaments/new
  # def new
  #   @medicament = Medicament.new
  # end

  # GET /medicaments/1/edit
  def edit
  end

  # POST /medicaments
  def create
    @medicament = Medicament.new(medicament_params)

    if @medicament.save
      redirect_to @medicament, notice: 'Medicament was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /medicaments/1
  def update
    respond_to do |format|
      if @medicament.update(medicament_params)
        redirect_to @medicament, notice: 'Medicament was successfully updated.'
      else
        render :edit
      end
    end
  end

  # DELETE /medicaments/1
  # def destroy
  #   @medicament.destroy
  #   redirect_to medicaments_url, notice: 'Medicament was successfully destroyed.'
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicament
      @medicament = Medicament.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medicament_params
      params.require(:medicament).permit(:name, :form, :composition, :indication, :dose, :contraindication, :average_price)
    end

    # Returns the most probable medicament wanted
    def search
    end
end
