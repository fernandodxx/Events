Rails.application.routes.draw do
  get 'users/index'
  get 'users/new'
  get 'events/index'
  get 'events/new'
  get 'events/show'
  get 'events/edit'
  
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "events#index"

  resources :events
end
