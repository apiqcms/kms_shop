require 'spec_helper'

module Kms
  module Public
    describe CartController, type: :controller do

      it 'has access to current_cart helper method' do
        expect(controller.view_context).to respond_to(:current_cart)
      end

      describe 'PATCH populate' do
        context 'when populate failed' do
          it "returns errors" do
            patch :populate, params: { variant_id: nil, quantity: 1 }, format: :json
            expect(response.unprocessable?).to be true
            expect(json['errors']).to_not be nil
          end
        end
        context 'when populate successful' do
          it "returns 200 status and cart json" do
            variant = FactoryGirl.create(:variant)
            patch :populate, params: { variant_id: variant.id, quantity: 1 }, format: :json
            expect(response).to have_http_status(200)
            expect(json.keys).to include('id', 'line_items')
          end
        end
      end
      describe 'PUT update' do
        context 'when update successful' do
          it "returns 200 status and cart json with updated quantities" do
            variant = FactoryGirl.create(:variant)
            patch :populate, params: { variant_id: variant.id, quantity: 1 }, format: :json
            put :update, params: { cart: [{ id: controller.view_context.current_cart.line_items.first.id, quantity: 5 }] }, format: :json
            expect(response).to have_http_status(200)
            expect(json['line_items'][0]['quantity']).to be_eql(5)
          end
        end
      end
      describe 'DELETE destroy' do
        it 'clears cart' do
          delete :destroy, format: :json
          expect(response.status).to be_eql(204)
        end
      end

    end
  end
end
