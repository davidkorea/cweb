Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :ccases do
    resources :posts
  end
  root 'ccases#index'

  namespace :admin do

    resources :ccases
  end

end
