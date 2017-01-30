FactoryGirl.define do
  factory :order, class: 'Kms::Order' do
    association :cart, factory: :cart_with_line_items
  end
end
