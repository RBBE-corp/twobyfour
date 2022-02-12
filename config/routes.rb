Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/profile', to: "users#profile"

  resources :playlists do
    resources :playlist_entrys, only: [:new, :create]
  end
  resources :playlist_entrys, only: [:destroy]

  resources :instrumentals, only: [:index, :show]

  resources :compositions, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :score, only: [:new, :create, :edit, :update]
  end
end
