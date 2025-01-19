Rails.application.routes.draw do
  get 'rooms/index'
  get 'rooms/show'
  get 'rooms/new'
  get 'rooms/create'
  get 'rooms/edit'
  get 'rooms/update'
  get 'rooms/destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  get 'users/show'
  root "rooms#index" # 初期表示を施設一覧ページに設定
  resources :users, only: [:new, :create, :edit, :update, :show]
  resources :rooms do
    resources :reservations, only: [:new, :create, :index, :show]
  end
  resource :session, only: [:new, :create, :destroy]
end
