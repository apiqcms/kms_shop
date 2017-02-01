module Kms
  class Cart < ActiveRecord::Base
    include Liquor::Dropable
    self.table_name_prefix = 'kms_'
    has_many :line_items
    has_one :order

    accepts_nested_attributes_for :line_items

    def total
      line_items.inject(0) {|sum, item| sum + item.total }
    end
  end
end
