Rails.application.routes.draw do

  resources :posts
  resources :charges

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  root to: 'home#top'
  get 'home/about'
  get 'home/index'
  post 'home/change' => "home#change"
  get '/user/:id/change' => 'home#user_change'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
