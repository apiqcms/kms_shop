FactoryGirl.define do
  factory :line_item, class: 'Kms::LineItem' do
    cart
    quantity 1
    variant
  end
end
