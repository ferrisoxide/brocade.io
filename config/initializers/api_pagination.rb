# frozen_string_literal: true

ApiPagination.configure do |config|
  config.paginator = :kaminari

  config.page_param = :page
end
