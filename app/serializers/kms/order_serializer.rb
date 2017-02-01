module Kms
  class OrderSerializer < ActiveModel::Serializer
    attributes :id
    attribute :created_at, if: :current_user
    attribute :total, if: :current_user
    has_many :line_items
    belongs_to :customer
    belongs_to :cart

  end
end
