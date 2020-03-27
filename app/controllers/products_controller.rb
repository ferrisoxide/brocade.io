class ProductsController < ApplicationController

  include ProductSearch

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = product_search(params)
  end

  def show
  end

  def edit

  end

  def update
    @product.update(product_params)
  end

  private

  def set_product
    @product = Product.from_param(params[:id])
  end

  def product_params
    params.require(:product).permit()
  end

end
