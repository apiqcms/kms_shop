module Kms
  class Order < ActiveRecord::Base
    belongs_to :cart
    belongs_to :customer

    delegate :line_items, :total, to: :cart
  end
end
