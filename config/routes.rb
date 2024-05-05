Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :books, only: [:index] do
    resources :notes, only: [:create, :update]
  end
  get '/login', to: 'sessions#new', as: :login
  post '/sessions', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout # Dodaj tę linię

  # config/routes.rb
  get 'chat', to: 'chat#index', as: 'chat'
  post 'chat', to: 'chat#create'
  get 'latest_messages', to: 'chat#latest_messages'
  # Ensure you have other necessary routes defined as well
end



