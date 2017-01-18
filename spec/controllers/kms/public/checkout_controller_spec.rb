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
      end

    end
  end
end
