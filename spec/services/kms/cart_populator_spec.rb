require 'spec_helper'

module Kms
  describe CartPopulator do
    describe '#populate' do
      context 'when variant found and quantity specified' do
        let(:cart) { FactoryGirl.create(:cart) }
        let(:variant) { FactoryGirl.create(:variant) }
        context 'when populating possible' do
          it 'returns not nil or false' do
            cart_populator = CartPopulator.new(cart, variant_id: variant.id, quantity: 1)
            expect(cart_populator.populate).to be_truthy
          end
          context 'when no line item for this variant' do
            it 'adds new line item to cart' do
              cart_populator = CartPopulator.new(cart, variant_id: variant.id, quantity: 1)
              expect {cart_populator.populate}.to change { cart.line_items.count }.by(1)
            end
          end
          context 'when line item exists for this variant' do
            it 'updates its quantity' do
              cart.line_items.create(variant_id: variant.id, quantity: 1)
              cart_populator = CartPopulator.new(cart, variant_id: variant.id, quantity: 1)
              expect {cart_populator.populate}.to change { cart.line_items.first.quantity }.by(1)
            end
          end

        end
        context 'when populating impossible' do
          it 'returns nil' do
            cart_populator = CartPopulator.new(cart, variant_id: 's', quantity: 1)
            expect(cart_populator.populate).to be_nil
          end
        end
      end
    end

  end
end
