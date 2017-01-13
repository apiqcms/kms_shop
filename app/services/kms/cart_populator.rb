module Kms
  class CartPopulator
    include ActiveModel::Validations

    attr_accessor :quantity, :variant_id
    validates :quantity, :variant_id, presence: true

    def initialize(cart, params)
      @cart = cart
      @variant_id = params[:variant_id]
      @quantity = params[:quantity].to_i
    end

    def populate
      return unless populating_possible?
      line_item = @cart.line_items.find_by(variant_id: @variant_id)
      unless line_item
        line_item = @cart.line_items.create(variant_id: @variant_id, quantity: @quantity)
      else
        line_item.update(quantity: line_item.quantity + @quantity)
      end
    end

    private

    def populating_possible?
      valid? && variant
    end

    def variant
      Variant.find_by(id: @variant_id)
    end
  end
end
