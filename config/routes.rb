Rails.application.routes.draw do
  resources :contacts
  get 'posts/index'
  get 'sessions/new'
  resources :posts do
    collection do
      post :confirm
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :favorites, only: [:create, :destroy, :show]
end
