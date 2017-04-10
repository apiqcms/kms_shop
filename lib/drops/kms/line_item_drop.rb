module Kms
  class LineItemDrop < Liquor::Drop
    attributes :id, :quantity, :price, :total, :title

    def price
      source.variant.price.to_s
    end

    def total
      source.total.to_s
    end

    def title
      [source.variant.product.name, source.variant.name].compact.join(' - ')
    end
  end
end
