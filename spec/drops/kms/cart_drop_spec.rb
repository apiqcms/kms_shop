require 'spec_helper'

module Kms
  describe CartDrop do
    it 'should be registered as "cart" in ExternalsRegistry' do
      expect(Kms::ExternalsRegistry.externals[:cart]).to be_instance_of(Proc)
    end

    it 'should return a "drop" of Kms::Cart' do
      request = ActionController::TestRequest.new({host:  'example.com'}, ActionController::TestRequest.new_session)
      controller = Kms::Public::PagesController.new
      controller.request = request
      expect(Kms::ExternalsRegistry.externals[:cart].call(request, controller)).to be_instance_of(described_class)
    end

    it 'should respond_to line_items' do
      request = ActionController::TestRequest.new({host:  'example.com'}, ActionController::TestRequest.new_session)
      controller = Kms::Public::PagesController.new
      controller.request = request
      cart_drop = Kms::ExternalsRegistry.externals[:cart].call(request, controller)
      expect(cart_drop).to respond_to(:line_items)
    end

  end
end
