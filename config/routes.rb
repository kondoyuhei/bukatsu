Rails.application.routes.draw do
  root   'posts#index'
  get    '/login',  to: 'users#login_page'
  post   '/login',  to: 'users#login'
  patch  '/login',  to: 'users#login'
  get    '/logout', to: 'users#logout'
  resources :posts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
