require 'spec_helper'

module Kms
  describe Cart, type: :model do
    it 'should have many line items' do
      expect(described_class.reflect_on_association(:line_items)).to_not be_nil
    end

    it 'should have one order' do
      expect(described_class.reflect_on_association(:order)).to_not be_nil
    end

    describe '#total' do
      it 'returns total price for all line items' do
        cart = FactoryGirl.create :cart_with_line_items
        expect(cart.total).to be_eql(200)
      end
    end
  end
end
