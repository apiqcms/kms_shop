FactoryGirl.define do
  factory :customer, class: 'Kms::Customer' do
    name "MyString"
    email "MyString"
    phone "MyString"
  end
end
