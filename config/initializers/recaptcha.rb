# frozen_string_literal: true

Recaptcha.configure do |config|
  config.site_key = ENV.fetch('RECAPTCHA_SITE_KEY', nil)
  config.secret_key = ENV.fetch('RECAPTCHA_SECRET_KEY', nil)
end
