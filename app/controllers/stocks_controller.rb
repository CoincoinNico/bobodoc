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
    @stock = Stock.new
    @stock.drugstore_id = params[:stock][:drugstore_id]
    @stock.medicament_id = params[:stock][:medicament_id]
    @stock.price = params[:stock][:price]

    # @stock.medicament = Medicament.find(stock_params[:medicament])
    # @stock.drugstore = Drugstore.find(stock_params[:drugstore])

    if @stock.save
      redirect_to @stock, notice: 'Stock was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @stock = Stock.find(params[:id]).destroy
    redirect_to stocks_url, notice: 'Stock was successfully destroyed.'
  end

end

