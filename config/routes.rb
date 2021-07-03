Rails.application.routes.draw do
  get 'search/search'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: 'photos#index'
  resources :photos do
    resources :comments, only: [:create, :destroy]
  end
  resources :tags, only: [:new, :create]
  resources :users, only: [:show, :edit, :update]
end
