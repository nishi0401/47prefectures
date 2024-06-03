Rails.application.routes.draw do
  resources :records, only: [:index]
  root to: "records#index"
end
