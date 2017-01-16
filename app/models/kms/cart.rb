module Kms
  class Cart < ActiveRecord::Base
    include Liquor::Dropable
    self.table_name_prefix = 'kms_'
    has_many :line_items
    has_one :order
  end
end
