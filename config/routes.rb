Rails.application.routes.draw do
  
  resources :users, only: [:index, :show] do  
    resources :posts, only: [:index, :new, :create, :show] do
      resources :comments, only: [:new, :create] do
      resources :likes, only: [:create]
    end
  end
end

  root "users#index"
end
