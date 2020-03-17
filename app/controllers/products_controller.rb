class ProductsController < ApplicationController

  include Rails::Pagination

  before_action :set_product, only: [:show, :update, :destroy]

  def index
    @products = if params[:query]
      paginate(Product.full_text_search(params[:query].split))
    else
      paginate(Product.all)
    end
  end

  def show
  end

  private

  def set_product
    @product = Product.from_param(params[:id])
  end

end
