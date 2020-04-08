Rails.application.routes.draw do
  resources :bloggers, only: [:index, :show, :new, :create]
  resources :destinations, only: [:index, :show]
  resources :posts, except: [:destroy]
end
