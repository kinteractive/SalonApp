SalonApp::Application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :services
  resources :categories

  get "users/new"

  match '/signup',    to: 'users#new'
  match 'signin' => 'sessions#new'
  match 'signout' => 'sessions#destroy', :via => :delete

  root to: 'web_pages#home'
  match '/home',        to: 'web_pages#home'
  match '/services',    to: 'web_pages#services'
  match '/information', to: 'web_pages#information'
  match '/meetus',      to: 'web_pages#meetus'
  match '/location',    to: 'web_pages#location'

end
