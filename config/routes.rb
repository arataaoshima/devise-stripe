Rails.application.routes.draw do

  resources :posts
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  
  root to: 'home#top'
  get 'home/about'
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :charges
end
