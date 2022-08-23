Rails.application.routes.draw do
  get 'user/index'
  get 'user/edit'
  post 'user/update'
  resources :posts do
    resources :comments
  end
  root 'posts#index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
