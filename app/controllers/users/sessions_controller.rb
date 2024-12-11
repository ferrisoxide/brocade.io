# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

    private

    def check_captcha
      return unless Rails.env.production?
      return if verify_recaptcha(action: 'login', secret_key: ENV.fetch('RECAPTCHA_SECRET', nil))

      self.resource = resource_class.new sign_in_params

      respond_with_navigational(resource) do
        flash.discard(:recaptcha_error) # We need to discard flash to avoid showing it on the next page reload
        render :new
      end
    end

    # before_action :configure_sign_in_params, only: [:create]

    # GET /resource/sign_in
    # def new
    #   super
    # end

    # POST /resource/sign_in
    # def create
    #   super
    # end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end
  end
end
