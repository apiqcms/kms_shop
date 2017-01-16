Kms::Shop::Engine.routes.draw do
end
Rails.application.routes.draw do
  resource :cart, only: [:update], controller: 'kms/public/cart'
end
