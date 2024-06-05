Rails.application.routes.draw do
  devise_for :users
  resources :records
  resources :users, only: [:show]
  root to: "records#index"
end
