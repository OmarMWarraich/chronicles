Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get "/", to: "devise/sessions#new"
  end

  
  resources :users, only: [:index, :show] do  
    resources :posts, only: [:index, :new, :create, :show] do
      resources :comments, only: [:new, :create] 
      resources :likes, only: [:create]
    end
  end

  root "users#index"
end
