class Api::ProductsController < ApplicationController
  # before_action :authenticate_user!

  def index
    render json: products, status: 200
  end

  def create
    product = products.build(product_params)

    if product.save
      render json: product, status: 201
    else
      render json: { errors: product.errors }, status: 422
    end
  end

  def update
    product = products.find(params[:id])

    if product.update_attributes(product_params)
      render json: product, status: 200
    else
      render json: { errors: product.errors }, status: 422 
    end
  end

  def destroy
    product = products.find(params[:id])
    product.destroy
    head 204
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :sale_price)
  end

  def products
    Product.ransack(params[:q]).result.order(:name)
  end
end
