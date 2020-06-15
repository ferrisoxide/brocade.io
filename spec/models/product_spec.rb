require 'rails_helper'

RSpec.describe User, type: :model do
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
end
