Rails.application.routes.draw do
  get 'user_sessions/new'
  get 'user_sessions/create'
  get 'user_sessions/destroy'
  root :to => 'users#index'
  resources :like_posts
  resources :posts do
    resources :comments, only: %i[create destroy], shallow: true
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
