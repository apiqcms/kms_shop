require 'spec_helper'

module Kms
  describe LineItem, type: :model do
    it 'should belong to cart' do
      expect(described_class.reflect_on_association(:cart)).to_not be_nil
    end
  end
end
