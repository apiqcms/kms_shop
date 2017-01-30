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

      # describe 'POST create' do
      #   context 'when save failed' do
      #     it "returns errors" do
      #       post :create, snippet: FactoryGirl.attributes_for(:invalid_snippet), format: :json
      #       expect(response.unprocessable?).to be true
      #       expect(json['errors']).to_not be nil
      #     end
      #   end
      #   context 'when save successful' do
      #     it "returns 204 status" do
      #       snippet_params = FactoryGirl.attributes_for(:snippet)
      #       post :create, snippet: snippet_params, format: :json
      #       expect(response).to have_http_status(204)
      #     end
      #   end
      #
      # end
      #
      # describe 'PUT update' do
      #   context 'when update failed' do
      #     it "returns errors" do
      #       snippet = FactoryGirl.create(:snippet)
      #       put :update, id: snippet.id, snippet: {slug: nil}, format: :json
      #       expect(response.unprocessable?).to be true
      #       expect(json['errors']).to_not be nil
      #     end
      #   end
      #   context 'when update successful' do
      #     it "returns 204 status" do
      #       snippet = FactoryGirl.create(:snippet)
      #       put :update, id: snippet.id, snippet: {slug: 'new-slug'}, format: :json
      #       expect(response).to have_http_status(204)
      #     end
      #   end
      # end
      #
      # describe 'GET snippet' do
      #   it "returns snippet object" do
      #     snippet = FactoryGirl.create(:snippet)
      #     get :show, id: snippet.id, format: :json
      #     expect(response).to be_success
      #     expect(json['name']).to eq(snippet.name)
      #     expect(json['slug']).to eq(snippet.slug)
      #     expect(json['content']).to eq(snippet.content)
      #   end
      # end
      #
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
