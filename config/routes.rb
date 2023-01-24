Rails.application.routes.draw do
  # Define your application routes per the DSL in   
  get 'users/index'
  root 'users#show'
  # Defines the root path route ("/")
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
end
