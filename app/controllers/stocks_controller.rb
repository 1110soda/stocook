class StocksController < ApplicationController
  before_action :authenticate_user!

  def index
    @stocks = current_user.stocks
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
