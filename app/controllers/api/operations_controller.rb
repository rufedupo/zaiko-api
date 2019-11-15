class Api::OperationsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: operations, status: 200
  end

  def show
    render json: operation, status: 200  
  end

  def create
    newOperation = operations.build(operation_params)

    if newOperation.save
      render json: newOperation, status: 201
    else
      render json: { errors: newOperation.errors }, status: 422
    end
  end

  def update
    if operation.update_attributes(operation_params)
      render json: operation, status: 200
    else
      render json: { errors: operation.errors }, status: 422 
    end
  end

  def destroy
    operation.destroy
    head 204
  end

  private
  def operation_params
    params.require(:operation).permit(:kind, :product, :trade, :quantity, :unit_price, :discount, :total_value, :release_date, :status)
  end

  def operations
    Operation.ransack(params[:q]).result.order(:release_date)
  end

  def operation
    operation = operations.find(params[:id])
  end
end