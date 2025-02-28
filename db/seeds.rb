# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  email: 'user@example.com',
  password: 'password',
  password_confirmation: 'password',
  confirmed_at: DateTime.now
)

Product.create(
  gtin: '0325381107293',
  gtin_encoding: 'gtin_13',
  name: 'Shea Butter Dry Skin Foot Cream',
  brand_name: "L'occitane",
  properties: { 'volume_ml' => 75, 'unit_count' => 1, 'volume_fluid_ounce' => 2.6 },
  source: 'product_open_data'
)
