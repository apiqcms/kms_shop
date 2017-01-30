module Kms
  module Shop
    class OrdersController < ApplicationController
      def index
        render json: Order.order('created_at desc'), root: false, scope: current_kms_user
      end

      def destroy
        @order = Kms::Order.find(params[:id])
        @order.destroy
      end
    end
  end
end
