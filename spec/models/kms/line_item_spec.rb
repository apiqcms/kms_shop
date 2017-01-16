require 'spec_helper'

module Kms
  describe LineItem, type: :model do
    it 'should belong to cart' do
      expect(described_class.reflect_on_association(:cart)).to_not be_nil
    end

    it 'should belong to variant' do
      expect(described_class.reflect_on_association(:variant)).to_not be_nil
    end

    describe '#total' do
      it 'returns total price for line item' do
        item = FactoryGirl.create :line_item
        expect(item.total).to be_eql(100)
      end
    end
  end
end
