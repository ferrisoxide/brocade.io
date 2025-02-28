# frozen_string_literal: true

ApiPagination.configure do |config|
  config.paginator = :pagy

  config.page_param = :page
end
