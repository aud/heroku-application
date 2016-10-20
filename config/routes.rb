Rails.application.routes.draw do
  root to: 'home#index'

  get 'home/index'
  get 'humans', to: 'home#humans'

  get 'log_feed', to: 'home#log_feed'

  get 'tickets', to: 'tickets#index_and_search'

  post 'destroy', to: 'tickets#destroy'

  resources :tickets
end
