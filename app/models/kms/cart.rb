module Kms
  class Cart < ActiveRecord::Base
    self.table_name_prefix = 'kms_'
    has_many :line_items
    has_one :order
  end
end
