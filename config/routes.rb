Rails.application.routes.draw do
  devise_for :users
  resources :records
  resources :users, only: [:show] do
    resources :destinations, only: [:index]
  end
  root to: "records#index"

end
