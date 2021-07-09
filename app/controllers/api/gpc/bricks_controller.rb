class Api::Gpc::BricksController < ApplicationController

  include Rails::Pagination

  def index
    @bricks = paginate(Gpc::Brick.includes(:klass).all)
  end
  
  def show
    @brick = Gpc::Brick.find_by(id: params[:id]) || Gpc::Brick.find_by(id: params[:code]) 
  end
end
