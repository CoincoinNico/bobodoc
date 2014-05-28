class DrugstoresController < ApplicationController
  before_action :set_drugstore, only: [:show, :edit, :update, :destroy]

  # GET /drugstores
  def index
    if params[:search].present?
      @drugstores = Drugstore.near(params[:search], 3)
    else
      @drugstores = Drugstore.all
    end
    @hash = Gmaps4rails.build_markers(@drugstores) do |drugstore, marker|
      marker.lat drugstore.latitude
      marker.lng drugstore.longitude
      marker.json({ title: drugstore.name, id: drugstore.id })
      marker.infowindow render_to_string(:partial => "/drugstores/map_box", locals: {drugstore: drugstore})
    end
  end

  # GET /drugstores/1
  def show
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    medoc = @drugstore.build.medicament(title: "onye")
    medoc.stocks.where(drugstore_id: @drugstore.id).update_attribute(price: params[:price])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drugstore
      @drugstore = Drugstore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drugstore_params
      params.require(:drugstore).permit(:name, :address, :phone, :description, :medicament_id)
    end
end
