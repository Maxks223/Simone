Rails.application.routes.draw do
  resources :prices, only: :index
  get 'prices/profit', to: 'prices#biggest'
end
