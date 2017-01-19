module Kms
  class Order < ActiveRecord::Base
    belongs_to :cart
    belongs_to :customer

    delegate :line_items, to: :cart
  end
end
