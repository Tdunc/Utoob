Rails.application.routes.draw do
  root 'playlists#index'
  
  devise_for :users

  resources :movies do
    resources :comments
  end
  resources :users do
    resources :comments
  end
  resources :users do
    resources :playlists
  end
end

