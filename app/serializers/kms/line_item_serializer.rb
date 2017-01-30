module Kms
  class LineItemSerializer < ActiveModel::Serializer
    attributes :id, :title, :price, :quantity, :total

    def title
      [object.variant.product.name, object.variant.name].compact.join(' - ')
    end

    def price
      object.variant.price
    end
  end
end
