Rails.application.routes.draw do
  resources :okrs
  get 'user/index'
  get 'user/edit'
  post 'user/update'
  get '/user/:user_id',to: "user#show",as: "user"
  resources :posts do
    resources :comments
    resources :likes
  end
  root 'posts#index'
  devise_for :users, controllers:{ sessions: 'users/sessions', registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks'}

  post '/ajaxlikes',to: "likes#create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
