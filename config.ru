# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

# Enable throttling if the THROTTLE environment variable is set to literal 'true' or '1'
if ENV['THROTTLE'].in?(%w[true 1])
  require 'rack/attack'
  use Rack::Attack
end

run Rails.application
Rails.application.load_server
