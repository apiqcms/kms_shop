Kms::Shop::Engine.routes.draw do
end
Rails.application.routes.draw do
  resource :cart, only: [:show, :update], controller: 'kms/public/cart'
end
