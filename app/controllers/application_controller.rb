# frozen_string_literal: true

# Base controller
class ApplicationController < ActionController::Base
  before_action :set_paper_trail_whodunnit

  include Pagy::Backend
end
