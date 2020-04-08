Rails.application.routes.draw do
  resources :bloggers, only: [:index, :show, :new, :create]
  resources :destinations, only: [:index, :show]

  resources :posts, except: [:destroy]
  post "/posts/:id/like", to: "posts#like", as: "like"
end
