Rails.application.routes.draw do
  root to: 'home#index'
  get 'home/index'

  get 'humans', to: 'home#humans'
end
