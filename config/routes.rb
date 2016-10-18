Rails.application.routes.draw do
  root to: 'home#index'

  get 'home/index'
  get 'humans', to: 'home#humans'

  get 'tickets', to: 'tickets#index_and_search'

  resources :tickets
end
