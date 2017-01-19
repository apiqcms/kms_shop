module Kms
  class OrderSerializer < ActiveModel::Serializer
    attributes :id
    has_many :line_items
    belongs_to :customer
  end
end
