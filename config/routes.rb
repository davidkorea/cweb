Rails.application.routes.draw do

  namespace :admin do
    resources :users
    root 'ccases#index'
    resources :ccases

  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  resources :ccases do
    resources :posts
  end
  root 'ccases#index'



  namespace :account do
    resources :users
  end










end
