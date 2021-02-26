class MarketsController < ApplicationController
  resources :markets, only: :index
end
