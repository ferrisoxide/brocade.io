module ProductSearch
  extend ActiveSupport::Concern

  included do
    include Rails::Pagination
  end

  def product_search(params)
    if params[:query]
      paginate(Product.full_text_search(params[:query].split))
    else
      paginate(Product.all)
    end
  end
end
