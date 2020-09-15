require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '.from_param' do

    describe 'EAN-13 product' do

      let!(:product) do
        create(
          :product, 
          gtin: '04012200328002',
          name: 'test product'
        )
      end

      subject { Product.from_param(param) }

      describe 'using EAN-14 code' do
        let(:param) { '04012200328002' }
        it { is_expected.to eq(product) }
      end

      describe 'using EAN-13 code' do
        let(:param) { '4012200328002' }
        it { is_expected.to eq(product) }
      end
    end
  end

  describe 'full text search' do

    subject { Product.full_text_search(terms).to_sql.gsub(/\n/, ' ') }

    context 'multiple terms' do
      let(:terms) { %w(foo bar) }
      let(:expected) do
        <<~SQL.gsub(/\n/, ' ').gsub(/\s$/, '')
          SELECT "products".* FROM "products"
          WHERE
          (to_tsvector('english', products.properties) @@ to_tsquery('foo:* & bar:*')
          OR to_tsvector('english', products.name) @@ to_tsquery('foo:* & bar:*')
          OR to_tsvector('english', products.brand_name) @@ to_tsquery('foo:* & bar:*') )
        SQL
      end

      it { is_expected.to eq(expected) }
    end

    context 'multiple terms with ampersand' do
      let(:terms) { %w(foo & bar) }

      let(:expected) do
        <<~SQL.gsub(/\n/, ' ').gsub(/\s$/, '')
          SELECT "products".* FROM "products"
          WHERE
          (to_tsvector('english', products.properties) @@ to_tsquery('foo:* & \\&:* & bar:*')
          OR to_tsvector('english', products.name) @@ to_tsquery('foo:* & \\&:* & bar:*')
          OR to_tsvector('english', products.brand_name) @@ to_tsquery('foo:* & \\&:* & bar:*') )
        SQL
      end

      it { is_expected.to eq(expected) }
    end
  end
end
