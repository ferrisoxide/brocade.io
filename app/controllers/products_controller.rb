class ProductsController < ApplicationController

  include ProductSearch

  before_action :set_product, only: [:show, :update, :destroy]

  def index
    @products = product_search(params)
  end

  def show
  end

  private

  def set_product
    @product = Product.from_param(params[:id])
  end

end
