module Kms
  class CartFinalizer
    include ActiveModel::Validations
    attr_accessor :customer

    def initialize(cart, customer_params)
      @cart = cart
      @customer =  Kms::Customer.new(customer_params)
    end

    def finalize
      return unless @customer.valid?
      order = @cart.create_order(customer: @customer)
      order.errors.blank? && order
    end
  end
end
