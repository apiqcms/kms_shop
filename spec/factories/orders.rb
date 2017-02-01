FactoryGirl.define do
  factory :order, class: 'Kms::Order' do
    customer
    association :cart, factory: :cart_with_line_items
  end
end
