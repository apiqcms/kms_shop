require 'spec_helper'

module Kms
  module Public
    describe CartController, type: :controller do

      it 'has access to current_cart helper method' do
        expect(controller.view_context).to respond_to(:current_cart)
      end

      describe 'PUT update' do
        context 'when update failed' do
          it "returns errors" do
            # put :update, params: { variant_id: nil, quantity: 1 }, format: :json
            # expect(response.unprocessable?).to be true
            # expect(json['errors']).to_not be nil
          end
        end
        # context 'when update successful' do
        #   it "returns 204 status" do
        #     snippet = FactoryGirl.create(:snippet)
        #     put :update, id: snippet.id, snippet: {slug: 'new-slug'}, format: :json
        #     expect(response).to have_http_status(204)
        #   end
        # end
      end

    end
  end
end
