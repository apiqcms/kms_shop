module Kms
  class LineItem < ActiveRecord::Base
    belongs_to :cart
    belongs_to :variant
  end
end
