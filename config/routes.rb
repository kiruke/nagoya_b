Rails.application.routes.draw do
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  post 'logout' => 'user_sessions#destroy', :as => :logout
  root :to => 'users#index'
  resources :like_posts
  resources :posts do
    resources :comments, only: %i[create destroy], shallow: true
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
