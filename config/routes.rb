Rails.application.routes.draw do
  get 'todos', to: 'todos#index'
  resources :acceptances, only: [:new, :create]
  resources :books
  
  #get 'greeting/index'
  get 'greeting/index', to:'greeting#index'

  root to:'greeting#index'
end
