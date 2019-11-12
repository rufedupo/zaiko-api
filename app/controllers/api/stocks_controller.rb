class Api::StocksController < ApplicationController
  # before_action :authenticate_user!

  def index
    render json: stocks, status: 200
  end

  def show
    render json: stock, status: 200  
  end
  
  private
  def stock_params
    params.require(:stock).permit(:product, :quantity, :cost, :status)
  end

  def stocks
    Stock.ransack(params[:q]).result.joins(:product).order(:name)
  end

  def stock
    stock = stocks.find(params[:id])
  end
end