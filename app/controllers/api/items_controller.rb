class Api::ItemsController < ApplicationController
  include Rails::Pagination

  before_action :set_item, only: [:show, :update, :destroy]

  def index
    @items = if params[:query]
      Product.full_text_search(params[:query].split)
    else
      paginate(Product.all)
    end
  end

  def show
  end

  # TODO Add
  # def create
  #   @item = Product.new(item_params)

  #   respond_to do |format|
  #     if @item.save
  #       format.json { render :show, status: :created, location: @item }
  #     else
  #       format.json { render json: @item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def update
  #   respond_to do |format|
  #     if @item.update(item_params)
  #       format.json { render :show, status: :ok, location: @item }
  #     else
  #       format.json { render json: @item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  private

  def set_item
    @item = Product.find_by(gtin: params[:id])
  end

  def item_params
    params.fetch(:item, {})
  end
end
