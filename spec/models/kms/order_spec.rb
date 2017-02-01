require 'spec_helper'

module Kms
  describe Order, type: :model do
    it 'should belong to cart' do
      expect(described_class.reflect_on_association(:cart)).to_not be_nil
    end
    it 'should belong to customer' do
      expect(described_class.reflect_on_association(:customer)).to_not be_nil
    end
    it { should delegate_method(:line_items).to(:cart) }
    it { should delegate_method(:total).to(:cart) }
    it { should accept_nested_attributes_for(:customer) }
    it { should accept_nested_attributes_for(:cart) }
  end
end
