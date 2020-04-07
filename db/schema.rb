# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_07_101242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brand", primary_key: "bsin", id: :string, limit: 6, force: :cascade do |t|
    t.string "brand_nm", limit: 255, null: false
    t.integer "brand_type_cd", default: 1, null: false
    t.string "brand_link", limit: 255
  end

  create_table "brand_group", primary_key: "bsin", id: :string, limit: 6, force: :cascade do |t|
    t.string "group_name", limit: 255, null: false
  end

  create_table "brand_owner", primary_key: "owner_cd", id: :integer, default: nil, force: :cascade do |t|
    t.string "owner_nm", limit: 255, null: false
    t.string "owner_link", limit: 255, null: false
    t.string "owner_wiki_en", limit: 255, null: false
  end

  create_table "brand_owner_bsin", primary_key: "bsin", id: :string, limit: 6, force: :cascade do |t|
    t.integer "owner_cd"
  end

  create_table "brand_type", primary_key: "brand_type_cd", id: :integer, default: nil, force: :cascade do |t|
    t.string "brand_type_nm", limit: 255, null: false
  end

  create_table "gs1_gcp", primary_key: "gcp_cd", id: :string, limit: 13, force: :cascade do |t|
    t.string "gln_cd", limit: 13, null: false
    t.string "gln_nm", limit: 255, null: false
    t.string "gln_addr_02", limit: 50, null: false
    t.string "gln_addr_03", limit: 50, null: false
    t.string "gln_addr_04", limit: 50, null: false
    t.string "gln_addr_postalcode", limit: 50, null: false
    t.string "gln_addr_city", limit: 50, null: false
    t.string "gln_country_iso_cd", limit: 50, null: false
    t.string "contact_name", limit: 50, null: false
    t.string "contact_tel", limit: 255, null: false
    t.string "contact_hotline", limit: 255
    t.string "contact_fax", limit: 255, null: false
    t.string "contact_mail", limit: 255, null: false
    t.string "contact_web", limit: 255, null: false
    t.string "gln_last_change", limit: 10, null: false
    t.string "gln_provider", limit: 13, null: false
    t.string "search_gtin_cd", limit: 13, null: false
    t.string "gepir_gcp_cd", limit: 13, null: false
    t.string "add_party_id", limit: 13, null: false
    t.string "return_code", limit: 3, null: false
    t.string "source", limit: 100, null: false
    t.date "sync_dt"
  end

  create_table "gs1_gcp_nb", primary_key: ["prefix_cd", "gcp_length"], force: :cascade do |t|
    t.string "prefix_cd", limit: 3, null: false
    t.integer "gcp_length", null: false
    t.integer "gcp_nb", null: false
  end

  create_table "gs1_gcp_rc", primary_key: "return_code", id: :integer, default: nil, force: :cascade do |t|
    t.string "return_name", limit: 255, null: false
    t.string "origin", limit: 255, null: false
  end

  create_table "gs1_gpc", primary_key: ["gpc_lang", "gpc_cd"], force: :cascade do |t|
    t.string "gpc_lang", limit: 3, null: false
    t.string "gpc_cd", limit: 20, null: false
    t.text "gpc_nm", null: false
    t.string "gpc_level", limit: 1, null: false
    t.string "source", limit: 255, null: false
  end

  create_table "gs1_gpc_hier", primary_key: "gpc_b_cd", id: :string, limit: 8, force: :cascade do |t|
    t.string "gpc_s_cd", limit: 8, null: false
    t.string "gpc_f_cd", limit: 8, null: false
    t.string "gpc_c_cd", limit: 8, null: false
  end

  create_table "gs1_prefix", primary_key: "prefix_cd", id: :string, limit: 3, force: :cascade do |t|
    t.string "prefix_nm", limit: 255, null: false
    t.string "country_iso_cd", limit: 11, null: false
  end

  create_table "gtin", primary_key: "gtin_cd", id: :string, limit: 13, force: :cascade do |t|
    t.integer "gtin_level_cd", default: 1, null: false
    t.string "gcp_cd", limit: 13
    t.string "bsin", limit: 6
    t.string "gpc_s_cd", limit: 8
    t.string "gpc_f_cd", limit: 8
    t.string "gpc_c_cd", limit: 8
    t.string "gpc_b_cd", limit: 8
    t.string "gtin_nm", limit: 255
    t.string "product_line", limit: 255
    t.float "m_g"
    t.float "m_oz"
    t.float "m_ml"
    t.float "m_floz"
    t.float "m_abv"
    t.float "m_abw"
    t.integer "pkg_unit", default: 1, null: false
    t.integer "pkg_type_cd"
    t.string "ref_cd", limit: 255
    t.string "source", limit: 255, null: false
    t.integer "img"
  end

  create_table "label", primary_key: "label_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "label_nm", limit: 255, null: false
    t.string "label_link", limit: 255, null: false
  end

  create_table "label_gtin", primary_key: ["label_id", "gtin_cd"], force: :cascade do |t|
    t.integer "label_id", null: false
    t.string "gtin_cd", limit: 13, null: false
  end

  create_table "nutrition_us", primary_key: "gtin_cd", id: :string, limit: 13, force: :cascade do |t|
    t.text "ingredients"
    t.float "serv_size_g", default: 0.0, null: false
    t.float "serv_size_ml", default: 0.0, null: false
    t.float "serv_ct", default: 1.0, null: false
    t.float "cal", default: 0.0, null: false
    t.float "cal_from_fat", default: 0.0, null: false
    t.float "tot_fat_g", default: 0.0, null: false
    t.float "tot_fat_dv", default: 0.0, null: false
    t.float "sat_fat_g", default: 0.0, null: false
    t.float "sat_fat_dv", default: 0.0, null: false
    t.float "trans_fat_g", default: 0.0, null: false
    t.float "chol_mg", default: 0.0, null: false
    t.float "chol_dv", default: 0.0, null: false
    t.float "sod_mg", default: 0.0, null: false
    t.float "sod_dv", default: 0.0, null: false
    t.float "pot_mg", default: 0.0, null: false
    t.float "pot_dv", default: 0.0, null: false
    t.float "tot_carb_g", default: 0.0, null: false
    t.float "tot_carb_dv", default: 0.0, null: false
    t.float "diet_fiber_g", default: 0.0
    t.float "diet_fiber_dv", default: 0.0, null: false
    t.float "sugars_g", default: 0.0, null: false
    t.float "protein_g", default: 0.0, null: false
    t.float "vitamin_a", default: 0.0, null: false
    t.float "vitamin_c", default: 0.0, null: false
    t.float "calcium", default: 0.0, null: false
    t.float "iron", default: 0.0, null: false
    t.text "source"
    t.date "sync_dt"
  end

  create_table "pkg_type", primary_key: "pkg_type_cd", id: :integer, default: nil, force: :cascade do |t|
    t.string "pkg_type_nm", limit: 255, null: false
    t.string "pkg_type_desc", limit: 255, null: false
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

end
