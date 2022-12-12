Rails.application.routes.draw do
  root to: 'sessions#new' # 一時的にルートはここにする。他にないため。
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
