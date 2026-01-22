class StocksController < ApplicationController
  before_action :authenticate_user!

  def index
    @stocks = current_user.stocks.order(expiration_date: :asc)
  end

  def new
    @stock = Stock.new
  end

  def create
    @stock = current_user.stocks.build(stock_params)
    if @stock.save
      redirect_to stocks_path
    else
      render :new
    end
  end

  def edit
    @stock = current_user.stocks.find(params[:id])
  end

  def update
    @stock = current_user.stocks.find(params[:id])
    if @stock.update(stock_params)
      redirect_to stocks_path
    else
      render :edit
    end
  end

  def destroy
    stock = current_user.stocks.find(params[:id])
    stock.destroy
    redirect_to stocks_path
  end

  private
    def stock_params
      params.require(:stock).permit(:name, :category, :quantity, :expiration_date)
    end
end
