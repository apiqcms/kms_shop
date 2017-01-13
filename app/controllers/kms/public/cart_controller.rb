module Kms
  module Public
    class CartController < ActionController::Base
      include Kms::CurrentCart
      protect_from_forgery with: :exception

      def update
        cart_populator = Kms::CartPopulator.new(current_cart, params)
        if cart_populator.populate
          render json: current_cart, root: false
        else
          render json: {errors: cart_populator.errors}.to_json, status: :unprocessable_entity
        end
      end
    end
  end
end
