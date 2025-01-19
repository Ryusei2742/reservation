Rails.application.routes.draw do
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
