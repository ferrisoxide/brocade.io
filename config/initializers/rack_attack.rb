# frozen_string_literal: true

# Enable throttling if the THROTTLE environment variable is set to literal 'true' or '1'
Rack::Attack.throttle('requests by ip', limit: 5, period: 60, &:ip) if ENV['THROTTLE'].in?(%w[true 1])
