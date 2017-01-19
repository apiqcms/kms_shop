require 'spec_helper'

module Kms
  describe CartFinalizer do
    let(:cart) { FactoryGirl.create(:cart_with_line_items) }
    describe '#finalize' do

      it 'validates customer' do
        cart_finalizer = CartFinalizer.new(cart, {})
        expect(cart_finalizer.customer).to receive(:valid?)
        cart_finalizer.finalize
      end
      context 'when no customer data passed' do
        it 'returns nil or false' do
          cart_finalizer = CartFinalizer.new(cart, {name: nil})
          expect(cart_finalizer.finalize).to be_falsy
        end
      end
      context 'when customer data valid' do
        let(:cart_finalizer) { CartFinalizer.new(cart, {name: 'John'}) }
        let(:result) { cart_finalizer.finalize }
        it 'returns Order object' do
          expect(result).to be_instance_of(Kms::Order)
        end
        it 'returns persisted Order object' do
          expect(result.persisted?).to be true
        end
        it 'returns order belonging to cart' do
          expect(result.cart_id).to_not be_nil
        end
        it 'returns order belonging to customer' do
          expect(result.customer_id).to_not be_nil
        end
      end
    end

  end
end
