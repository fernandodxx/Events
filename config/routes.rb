Rails.application.routes.draw do
  
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "events#index"
  resources :events do
    resources :event_participants, only: [:create]
  end 
  
  resources :users

  resources :user_sessions

end
