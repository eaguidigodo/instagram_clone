Rails.application.routes.draw do
  get 'posts/index'
  get 'sessions/new'
  resources :posts
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :favorites, only: [:create, :destroy]
end
