Rails.application.routes.draw do
  root   'posts#index'
  get    '/login',  to: 'users#login_page'
  post   '/login',  to: 'users#login'
  patch  '/login',  to: 'users#login'
  delete '/logout', to: 'users#logout'
  get    '/users/list', to: 'users#list'
  get    '/posts/list', to: 'posts#list'
  get    '/students/:id/new', to: 'students#new'
  resources :posts
  resources :users
  resources :students, except: [:index, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
