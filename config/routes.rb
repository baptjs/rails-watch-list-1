Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'lists#index'
  resources :lists, except: [:edit, :update] do
    resources :saved_movies, only: [:new, :create]
    resources :reviews, only: :create
  end
  resources :saved_movies, only: :destroy
  resources :reviews, only: :destroy
end
