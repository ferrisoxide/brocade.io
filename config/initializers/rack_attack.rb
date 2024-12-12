# frozen_string_literal: true

Rack::Attack.throttle('requests by ip', limit: 5, period: 60, &:ip)
