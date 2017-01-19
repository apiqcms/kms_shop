module Kms
  module Public
    class CheckoutController < ActionController::Base
      include Kms::CurrentCart
      protect_from_forgery with: :exception

      def create
        cart_finalizer = Kms::CartFinalizer.new(current_cart, customer_params)
        if order = cart_finalizer.finalize
          session[:cart_id] = nil
          render json: order, root: false
        else
          render json: {errors: order || {}}.to_json, status: :unprocessable_entity
        end
      end

      protected

      def customer_params
        params.require(:customer).permit(:name, :email, :phone)
      end
    end
  end
end
