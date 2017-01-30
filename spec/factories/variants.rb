FactoryGirl.define do
  factory :variant, class: 'Kms::Variant' do
    product
    price 100

  end
end
