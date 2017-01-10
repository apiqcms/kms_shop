module Kms
  module Public
    class CartController < ActionController::Base
      include Kms::CurrentCart

      def update
        current_cart
      end
    end
  end
end
