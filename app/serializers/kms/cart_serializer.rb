module Kms
  class CartSerializer < ActiveModel::Serializer
    attributes :id
    has_many :line_items
  end
end
