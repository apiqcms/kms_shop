module Kms
  module Shop
    class OrdersController < ApplicationController
      wrap_parameters :order, include: [:customer_attributes, :cart_attributes]
      def index
        render json: Order.order('created_at desc'), root: false, scope: current_kms_user
      end

      def update
        @order = Kms::Order.find(params[:id])
        if @order.update(order_params)
          head :no_content
        else
          render json: {errors: @order.errors}.to_json, status: :unprocessable_entity
        end
      end

      def destroy
        @order = Kms::Order.find(params[:id])
        @order.destroy
      end

      protected

      def order_params
        params.require(:order).permit(customer_attributes: [:id, :name, :email, :phone], cart_attributes: [:id, { line_items_attributes: [:id, :quantity]}])
      end
    end
  end
end
