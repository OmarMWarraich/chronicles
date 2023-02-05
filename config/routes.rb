Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:index, :show] do  
    resources :posts, only: [:index, :new, :create, :show, :destroy] do
      resources :comments, only: [:new, :create, :destroy] 
      resources :likes, only: [:create]
    end
  end

  root "users#index"
end
