module Kms
  module CurrentCart
    extend ActiveSupport::Concern

    included do
      helper_method :current_cart
    end

    protected

    def current_cart
      return @current_cart if @current_cart
      if session[:cart_id]
        @current_cart = Kms::Cart.find_by(id: session[:cart_id])
      else
        new_cart = Kms::Cart.create
        session[:cart_id] = new_cart.id
        @current_cart = new_cart
      end
    end
  end
end
