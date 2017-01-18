require 'spec_helper'

module Kms
  describe Customer, type: :model do
    it { should validate_presence_of(:name) }
  end
end
