Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'pages#home'
  resources :video_games, only: [:index, :update, :destroy, :edit, :update]
  get '/dashboard', to: 'dashboard#show'
  get '/dashboard/new', to: 'video_games#new', as: "new_video_game"
  post '/dashboard/new', to: 'video_games#create', as: "create_video_game"
  post 'rents', to: 'rents#create', as: "new_rent"
end
