module Kms
  class CartDrop < Liquor::Drop
    attributes :total
    has_many :line_items

    def total
      source.total.to_s
    end
  end
end
