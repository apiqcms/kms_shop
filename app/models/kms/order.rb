module Kms
  class Order < ActiveRecord::Base
    belongs_to :cart
    belongs_to :customer
  end
end
