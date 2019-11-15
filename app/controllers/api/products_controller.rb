class Api::ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: products, status: 200
  end

  def show
    render json: product, status: 200  
  end

  def create
    newProduct = products.build(product_params)
    
    if newProduct.save
      render json: newProduct, status: 201
    else
      render json: { errors: newProduct.errors }, status: 422
    end
  end

  def update
    if product.update_attributes(product_params)
      render json: product, status: 200
    else
      render json: { errors: product.errors }, status: 422 
    end
  end

  def destroy
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

  def product
    product = products.find(params[:id])
  end
end
