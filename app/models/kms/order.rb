module Kms
  class Order < ActiveRecord::Base
    belongs_to :cart
  end
end
