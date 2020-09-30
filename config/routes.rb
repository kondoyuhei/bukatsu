Rails.application.routes.draw do
  root   'posts#index'
  get    '/login',  to: 'users#login_page'
  post   '/login',  to: 'users#login'
  patch  '/login',  to: 'users#login'
  delete '/logout', to: 'users#logout'
  resources :posts do
    resource :comments, only: [:create, :update, :destroy]
  end
  resources :users do
    collection do
      get  :list
      get  :first_user
      post :first_user_registration
    end
  end
  resources :students, except: [:new, :create] do
    # member do 以下に指定したルーティングに「method :xyz」を指定すると、
    #   medthod 'students/:id', to: 'students#xyz'
    # が追加される
    member do
      get  :set
      post :add
    end
    collection do
      get  :list
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
