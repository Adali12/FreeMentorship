Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :meetings
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :users
  end
  namespace :mentor do
    resources :meetings
  end
  root 'sessions#new'
end
