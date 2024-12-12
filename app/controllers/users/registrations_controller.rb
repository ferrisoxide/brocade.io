# frozen_string_literal: true

module Users
  # Subclass the Devise RegistrationsController to add reCAPTCHA validation
  class RegistrationsController < Devise::RegistrationsController
    prepend_before_action :check_captcha, only: [:create] # rubocop:disable Rails/LexicallyScopedActionFilter

    def check_captcha
      return true if verify_recaptcha(action: 'registration')

      self.resource = resource_class.new sign_up_params
      resource.validate # Look for any other validation errors besides reCAPTCHA
      set_minimum_password_length

      respond_with_navigational(resource) do
        flash.discard(:recaptcha_error) # We need to discard flash to avoid showing it on the next page reload
        render :new
      end
    end
  end
end
