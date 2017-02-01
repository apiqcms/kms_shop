require 'spec_helper'

module Kms
  module Shop
    describe OrdersController, type: :controller do
      routes { Kms::Shop::Engine.routes }
      login_user
      describe 'GET index' do
        it 'returns orders json representation' do
          FactoryGirl.create(:order)
          get :index, format: :json

          expect(response).to be_success
          expect(json.length).to eq(1)
          expect(json[0].keys).to include('id', 'total', 'line_items', 'customer', 'created_at')
          expect(json[0]['line_items'][0].keys).to include('id', 'title', 'price', 'quantity', 'total')
        end
      end

      describe 'PUT update' do
        context 'when update failed' do
          it "returns errors" do
            order = FactoryGirl.create(:order)
            put :update, params: { id: order.id, order: { customer_attributes: { name: nil } } }, format: :json
            expect(response.unprocessable?).to be true
            expect(json['errors']).to_not be nil
          end
        end
        context 'when update successful' do
          it "returns 204 status" do
            order = FactoryGirl.create(:order)
            put :update, params: { id: order.id, order: { customer_attributes: {name: 'John'} } }, format: :json
            expect(response).to have_http_status(204)
          end
        end
      end

      describe 'DELETE order' do
        it 'deletes order and returns no content' do
          order = FactoryGirl.create(:order)
          delete :destroy, params: { id: order.id }, format: :json
          expect(response).to have_http_status(204)
        end
      end
    end
  end
end
