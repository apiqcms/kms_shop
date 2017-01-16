Kms::Shop::Engine.routes.draw do
end
Rails.application.routes.draw do
  resource :cart, only: [:update, :destroy], controller: 'kms/public/cart'
end
