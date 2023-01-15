Rails.application.routes.draw do
  resources :users
  root to: 'home#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :posts do
    resources :post_comments, only: %i[create destroy]
  end
  resources :mypage, only: :index
end
