module Kms
  class Order < ActiveRecord::Base
    belongs_to :cart
    belongs_to :customer

    accepts_nested_attributes_for :customer, :cart
    delegate :line_items, :total, to: :cart

  end
end
