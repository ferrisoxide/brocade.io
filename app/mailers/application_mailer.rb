# frozen_string_literal: true

# Base class for mailers
class ApplicationMailer < ActionMailer::Base
  default from: 'contact@brocade.io'
  layout 'mailer'
end
