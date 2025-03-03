Rails.application.routes.draw do
  root "pages#home"

  resources :rooms do
    resources :reservations, only: [:new, :create, :index] do
      collection do
        post :confirm
      end
    end
    get :search, on: :collection
  end

  resources :reservations, only: [:index, :show]
  resources :users, only: [:new, :create, :show, :update, :show] do
    member do
      get :edit_account
      patch :update_account
      get :edit_profile
      patch :update_profile
    end
  end
  resource :session, only: [:new, :create, :destroy]
end
