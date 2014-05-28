class StocksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    @stocks = Medicament.all
  end

  def show
    # @medicament = Medicament.search(params[:search])
  end

  def new
    @stock = Stock.new
  end

  def edit
  end

  def create
    stock = Stock.create(stock_params)
    #Update la colonne cheapest du Médicament
    medicament = stock.medicament


    if stock.save
      redirect_to stock, notice: 'Stock was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @stock = Stock.find(params[:id]).destroy
    redirect_to stocks_url, notice: 'Stock was successfully destroyed.'
  end

  private

  def stock_params
    params.require(:stock).permit(:drugstore_id, :medicament_id, :position, :price)
  end

end