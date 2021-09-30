Rails.application.routes.draw do
  get 'authors/new'
  get 'authors/show'
  get 'authors/index'
  get 'sessions/new'
  get :signup,       to: 'admin_users#new'
  resources :admin_users
  resources :authors
  resources :books
  get    :login,     to: 'sessions#new'
  post   :login,     to: 'sessions#create'
  delete :logout,    to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
