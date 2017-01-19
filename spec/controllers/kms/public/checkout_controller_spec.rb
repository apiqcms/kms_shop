require 'spec_helper'

module Kms
  module Public
    describe CheckoutController, type: :controller do
      describe '#create' do
        context 'when validation errors' do
          it 'returns errors in json' do
            post :create, params: { customer: { name: nil } }, format: :json
            expect(response.unprocessable?).to be true
            expect(json['errors']).to_not be nil
          end
        end
        context 'when no validation errors' do
          it 'returns 200 status and order json' do
            post :create, params: { customer: { name: 'John' } }, format: :json
            expect(response).to have_http_status(200)
            expect(json.keys).to include('id', 'line_items', 'customer')
          end
          it 'resets current cart' do
            post :create, params: { customer: { name: 'John' } }, format: :json
            expect(session[:cart_id]).to be_nil
          end
        end
      end

    end
  end
end
