# frozen_string_literal: true

class CreateVersions < ActiveRecord::Migration[6.0] # rubocop:disable Style/Documentation
  TEXT_BYTES = 1_073_741_823

  def change
    create_table :versions do |t|
      t.string   :item_type, { null: false }
      t.integer  :item_id,   null: false, limit: 8
      t.string   :event,     null: false
      t.string   :whodunnit
      t.jsonb    :object
      t.datetime :created_at
    end
    add_index :versions, %i[item_type item_id]
  end
end
