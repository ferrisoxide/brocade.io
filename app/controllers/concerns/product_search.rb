# frozen_string_literal: true

module ProductSearch # rubocop:disable Style/Documentation
  extend ActiveSupport::Concern

  included do
    include Rails::Pagination
  end

  def product_search(params)
    if params[:query].present?
      pagy, records = pagy(build_query(params[:query]))
    else
      pagy, records = pagy(Product.all)
    end

    [pagy, records]
  end

  private

  def build_query(query_params)
    base_query = Product.full_text_search(query_params.split)

    return base_query unless gtin?(query_params)

    base_query.or(Product.by_gtin(query_params))
  end

  def gtin?(string)
    string !~ /\D/
  end
end
