Rails.application.routes.draw do
  root "pages#home"

  resources :rooms do
    resources :reservations, only: [:new, :create, :index]
    collection do
      get :search
    end
  end

  resources :reservations, only: [:index, :show]
  resources :users, only: [:new, :create, :edit, :update, :show]
  resource :session, only: [:new, :create, :destroy]
end
