Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  # get 'contact', to: 'static_pages#contact'
  # get 'team', to: 'static_pages#team'
  # get 'welcome/:user_entry', to: 'welcome#show'
  # resources :sessions, only: [:new, :create, :destroy]
  resources :users  
  resources :events
  resources :attendances



end
