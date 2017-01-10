FactoryGirl.define do
  factory :order, class: 'Kms::Order' do
    cart
  end
end
