Rails.application.routes.draw do
  root "rooms#index"

  resources :rooms do
    resources :reservations, only: [:new, :create]
  end

  resources :reservations, only: [:index, :show]
  resources :users, only: [:new, :create, :edit, :update, :show]
  resource :session, only: [:new, :create, :destroy]
end
