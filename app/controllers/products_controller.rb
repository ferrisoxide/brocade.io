class ProductsController < ApplicationController

  include ProductSearch

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  def index
    @products = product_search(params)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_product
    @product = Product.from_param(params[:id])
  end

  def product_params
    params
      .require(:product)
      .permit(
        :gtin,
        :name,
        :brand_name,
        properties: {}
      ).tap do |permitted_params|
        permitted_params[:properties].keys.each do |key|
          permitted_params[:properties].delete(key) unless permitted_params[:properties][key].present?
        end
      end
  end

end
