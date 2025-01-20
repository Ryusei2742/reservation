Rails.application.routes.draw do
  root "rooms#index"

  resources :rooms do
    resources :reservations, only: [:new, :create]
  end

  resources :reservations, only: [:index, :show]
end
