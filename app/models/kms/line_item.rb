module Kms
  class LineItem < ActiveRecord::Base
    belongs_to :cart
    belongs_to :variant

    def total
      variant.price * quantity
    end
  end
end
