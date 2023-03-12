# frozen_string_literal: true

class ProductsController < ApplicationController
  include ProductSearch

  before_action :authenticate_user!, except: %i[index show destroy]
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = product_search(params)
  end

  def show
    if @product.nil?
      respond_to do |format|
        format.html { redirect_to products_path, alert: 'Product not found' }
        format.json { render json: { error: 'Product not found' }, status: :not_found }
      end
    else
      respond_to do |format|
        format.html
        format.json
      end
    end
  end

  def new
    @product = Product.new
  end

  def edit; end

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

  def destroy
    raise 'Not implemented'
  end

  private

  # SMELL: Not used?
  def flatten_product_attributes(product)
    product
      .attributes
      .slice(*%w[gtin name brand_name])
      .merge(product.properties)
      .compact
  end

  # SMELL: Not used?
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
        permitted_params[:properties].each_key do |key|
          permitted_params[:properties].delete(key) if permitted_params[:properties][key].blank?
        end
      end
  end
end
