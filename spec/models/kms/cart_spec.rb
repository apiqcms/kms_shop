require 'spec_helper'

module Kms
  describe Cart, type: :model do
    it 'should have many line items' do
      expect(described_class.reflect_on_association(:line_items)).to_not be_nil
    end

    it 'should have one order' do
      expect(described_class.reflect_on_association(:order)).to_not be_nil
    end
  end
end
