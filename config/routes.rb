Rails.application.routes.draw do
  
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "events#index"
  resources :events

  resources :users, only: [:new, :create, :index]

  resources :user_sessions, only: [:new, :create, :destroy]

end
