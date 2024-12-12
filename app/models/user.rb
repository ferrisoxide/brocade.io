# frozen_string_literal: true

class User < ApplicationRecord # rubocop:disable Style/Documentation
  has_paper_trail

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  class << self
    def authenticate(email, password)
      user = User.find_for_authentication(email:)
      user.try(:valid_password?, password) ? user : nil
    end
  end
end
