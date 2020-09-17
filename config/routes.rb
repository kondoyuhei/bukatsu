Rails.application.routes.draw do
  root   'posts#index'
  get    '/login',  to: 'users#login_page'
  post   '/login',  to: 'users#login'
  patch  '/login',  to: 'users#login'
  delete '/logout', to: 'users#logout'
  get    '/users/list', to: 'users#list'
  get    '/posts/list', to: 'posts#list'
  get    '/students/:id/new', to: 'students#new'
  get    '/users/first_user', to: 'users#first_user'
  post   '/users/first_user', to: 'users#first_user_registration'
  resources :posts
  resources :users
  resources :students
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
