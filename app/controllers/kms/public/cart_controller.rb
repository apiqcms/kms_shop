module Kms
  module Public
    class CartController < ActionController::Base
      include Kms::CurrentCart
      protect_from_forgery with: :exception

      def populate
        cart_populator = Kms::CartPopulator.new(current_cart, params)
        if cart_populator.populate
          render json: current_cart, root: false
        else
          render json: {errors: cart_populator.errors}.to_json, status: :unprocessable_entity
        end
      end

      def update
        if current_cart.update(cart_params)
          render json: current_cart, root: false
        else
          render json: {errors: current_cart.errors}.to_json, status: :unprocessable_entity
        end
      end

      def destroy
        current_cart.line_items.clear
      end

      protected

      def cart_params
        # hiding line_items_attributes from client side
        line_items_params = params[:cart].to_a
        params[:cart] = { line_items_attributes: line_items_params }
        params.require(:cart).permit(line_items_attributes: [:id, :quantity])
      end
    end
  end
end
