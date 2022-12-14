Rails.application.routes.draw do

  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  authenticated :user do
    root to: "groups#index", as: :authenticated_root
  end

  
  unauthenticated :user do
    root to: "splash_pages#splash", as: :unauthenticated_root
  end

  resources :groups, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :expenses, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  


end
