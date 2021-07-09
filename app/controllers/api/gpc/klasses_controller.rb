class Api::Gpc::KlassesController < ApplicationController

  include Rails::Pagination

  def index
    @klasses = paginate(Gpc::Klass.all)
  end
  
  def show
    @klass = Gpc::Klass.find_by(id: params[:id]) || Gpc::Klass.find_by(code: params[:id]) 
  end
end
