module Kms
  class CartFinalizer
    include ActiveModel::Validations
    attr_accessor :customer

    def initialize(cart, params)
      @cart = cart
      @customer =  Kms::Customer.new(params[:customer])
    end

    def finalize
      return unless @customer.valid?
      order = @cart.create_order(customer: @customer)
      order.errors.blank? && order
    end
  end
end
