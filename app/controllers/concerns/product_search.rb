module ProductSearch
  extend ActiveSupport::Concern

  included do
    include Rails::Pagination
  end

  def product_search(params)
    if params[:query].present?
      paginate(
        Product
          .full_text_search(params[:query].split)
          .or(Product.by_gtin(params[:query]))
      )
    else
      paginate(Product.all)
    end
  end

end
