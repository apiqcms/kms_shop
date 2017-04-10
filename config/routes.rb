Kms::Shop::Engine.routes.draw do
  constraints(format: "json") do
    resources :orders, format: true
  end
end
Rails.application.routes.draw do
  resource :cart, only: [:update, :destroy], controller: 'kms/public/cart' do
    patch :populate, on: :collection
  end
  resource :checkout, only: [:create], controller: 'kms/public/checkout'
end
