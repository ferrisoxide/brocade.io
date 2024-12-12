# frozen_string_literal: true

module Users
  # Subclass the Devise SessionsController to add reCAPTCHA validation
  class SessionsController < Devise::SessionsController
    prepend_before_action :check_captcha, only: [:create] # rubocop:disable Rails/LexicallyScopedActionFilter

    private

    def check_captcha
      return true if verify_recaptcha(action: 'login')

      self.resource = resource_class.new sign_in_params

      respond_with_navigational(resource) do
        flash.discard(:recaptcha_error) # We need to discard flash to avoid showing it on the next page reload
        render :new
      end
    end
  end
end
