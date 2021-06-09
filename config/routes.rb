Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'

  resources :users, only: [:show, :index, :edit, :update]

  resources :movies do
    resources :movie_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

end