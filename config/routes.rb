Rails.application.routes.draw do
  resources :markets, only: :index
end
