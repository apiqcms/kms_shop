FactoryGirl.define do
  factory :cart, class: 'Kms::Cart' do
    factory :cart_with_line_items do
      after(:create) do |cart, evaluator|
        create_list(:line_item, 2, cart: cart)
      end
    end

  end
end
