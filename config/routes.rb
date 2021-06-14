Rails.application.routes.draw do
  devise_for :users
  root to: 'photos#index'
  resources :photos do
    collection do
      get 'search'
    end
  end
  resources :tags, only: [:new, :create]
  resources :users, only: [:show, :edit, :update]
end
