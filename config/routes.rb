Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  
  resources :sessions, only: :create
  get 'login', to:'sessions#new'
  post 'logout', to:'sessions#destroy'
end
