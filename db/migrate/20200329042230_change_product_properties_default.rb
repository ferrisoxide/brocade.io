# frozen_string_literal: true

class ChangeProductPropertiesDefault < ActiveRecord::Migration[6.0] # rubocop:disable Style/Documentation
  def change
    change_column_default(:products, :properties, {}) # rubocop:disable Rails/ReversibleMigration
  end
end
