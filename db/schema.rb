# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_05_133208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gpc_attribute_types", force: :cascade do |t|
    t.string "code", null: false
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_gpc_attribute_types_on_code", unique: true
  end

  create_table "gpc_attribute_values", force: :cascade do |t|
    t.string "code", null: false
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_gpc_attribute_values_on_code", unique: true
  end

  create_table "gpc_brick_attribute_type_attribute_values", force: :cascade do |t|
    t.bigint "gpc_brick_id", null: false
    t.bigint "gpc_attribute_type_id", null: false
    t.bigint "gpc_attribute_value_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gpc_attribute_type_id"], name: "idx_gpc_brick_attribute_type_and_values_on_attribute_type_id"
    t.index ["gpc_attribute_value_id"], name: "idx_gpc_brick_attribute_type_and_values_on_attribute_value_id"
    t.index ["gpc_brick_id", "gpc_attribute_type_id", "gpc_attribute_value_id"], name: "idx_gpc_brick_attribute_type_and_values_unique", unique: true
    t.index ["gpc_brick_id"], name: "idx_gpc_brick_attribute_type_and_values_on_brick_id"
  end

  create_table "gpc_bricks", force: :cascade do |t|
    t.string "code", null: false
    t.string "description"
    t.bigint "gpc_klass_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_gpc_bricks_on_code", unique: true
    t.index ["gpc_klass_id"], name: "index_gpc_bricks_on_gpc_klass_id"
  end

  create_table "gpc_families", force: :cascade do |t|
    t.string "code", null: false
    t.string "description"
    t.bigint "gpc_segment_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_gpc_families_on_code", unique: true
    t.index ["gpc_segment_id"], name: "index_gpc_families_on_gpc_segment_id"
  end

  create_table "gpc_klasses", force: :cascade do |t|
    t.string "code", null: false
    t.string "description"
    t.bigint "gpc_family_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_gpc_klasses_on_code", unique: true
    t.index ["gpc_family_id"], name: "index_gpc_klasses_on_gpc_family_id"
  end

  create_table "gpc_segments", force: :cascade do |t|
    t.string "code", null: false
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_gpc_segments_on_code", unique: true
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer "resource_owner_id"
    t.integer "application_id"
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "gtin"
    t.string "gtin_encoding"
    t.string "name"
    t.string "brand_name"
    t.jsonb "properties", default: {}
    t.string "source"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "to_tsvector('english'::regconfig, (brand_name)::text)", name: "products_brand_name_full_text_index", using: :gin
    t.index "to_tsvector('english'::regconfig, (name)::text)", name: "products_name_full_text_index", using: :gin
    t.index "to_tsvector('english'::regconfig, properties)", name: "products_properties_full_text_index", using: :gin
    t.index ["brand_name"], name: "index_products_on_brand_name"
    t.index ["gtin"], name: "index_products_on_gtin", unique: true
    t.index ["name"], name: "index_products_on_name"
    t.index ["properties"], name: "index_products_on_properties"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.jsonb "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "gpc_brick_attribute_type_attribute_values", "gpc_attribute_types"
  add_foreign_key "gpc_brick_attribute_type_attribute_values", "gpc_attribute_values"
  add_foreign_key "gpc_brick_attribute_type_attribute_values", "gpc_bricks"
  add_foreign_key "oauth_access_tokens", "users", column: "resource_owner_id"
end
