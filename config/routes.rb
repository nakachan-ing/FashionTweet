Rails.application.routes.draw do
  get 'search/search'
  devise_for :users
  root to: 'photos#index'
  resources :photos do
    resources :comments, only: :create
  end
  resources :tags, only: [:new, :create]
  resources :users, only: [:show, :edit, :update]
end
