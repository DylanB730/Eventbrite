Rails.application.routes.draw do
  root "static_pages#index"
  root to: 'home#index'

  get 'static_pages/index'
  get 'static_pages/secret'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'contact', to: 'static_pages#contact'
  # get 'team', to: 'static_pages#team'
  # get 'welcome/:user_entry', to: 'welcome#show'
  # resources :sessions, only: [:new, :create, :destroy]
  resources :users  
  resources :events
  resources :attendances



end
