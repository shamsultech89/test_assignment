Rails.application.routes.draw do
  resources :tags, only: :create
  resources :comments, only: :create
  resources :discussion_topics, only: :create
  resources :campaigns, only: :create
  resources :sessions, only: :create
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
