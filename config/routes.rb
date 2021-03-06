Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/profile', to: "users#profile"
  patch 'compositions/:id/addrep', to: "compositions#addrep"

  resources :playlists, only: [:index, :show, :create, :edit, :update, :destroy] do
    resources :playlist_compositions, only: [:new, :create]
  end
  resources :playlist_compositions, only: [:destroy]

  resources :instrumentals, only: [:index, :show]

  resources :compositions, except: [:index] do
    resources :score, only: [:new, :create]
    get '/karaoke', to: "compositions#karaoke"
    post '/karaoke', to: "compositions#checker"
  end
  resources :memory_lists do
    resources :memory_list_flashcards, only: [:new, :create]
  end
  resources :memory_list_flashcards, only: [:destroy]
  resources :flashcards, only: [:index, :show, :create, :destroy]
end
