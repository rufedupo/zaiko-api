class Api::TradesController < ApplicationController
  # before_action :authenticate_user!

  def index
    render json: trades, status: 200
  end

  def show
    render json: trade, status: 200  
  end

  def create
    newTrade = trades.build(trade_params)

    if newTrade.save
      render json: newTrade, status: 201
    else
      render json: { errors: newTrade.errors }, status: 422
    end
  end

  def update
    if trade.update_attributes(trade_params)
      render json: trade, status: 200
    else
      render json: { errors: trade.errors }, status: 422 
    end
  end

  def destroy
    trade.destroy
    head 204
  end

  private
  def trade_params
    params.require(:trade).permit(:kind, :discount, :total_value, :release_date, :status)
  end

  def trades
    Trade.ransack(params[:q]).result.order(:release_date)
  end

  def trade
    trade = trades.find(params[:id])
  end
end
