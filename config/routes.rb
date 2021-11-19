  Rails.application.routes.draw do
    namespace :admin do
  %i(
    users
    items
    categories
      ).each do |name|
        resources name, only: %i(index show new create edit update destroy)
        resources :roles, only:  %i(index, show)
      end
      
      get    'login',   to: 'sessions#new'    
      post   'login',   to: 'sessions#create'
      delete 'logout',  to: 'sessions#destroy'
  
      root to: 'sessions#new'
      end
      
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show, :create]
      resources :items, only: [:index]
      resources :categories, only: [:index, :show]

      post 'login', to: 'sessions#create'
    end
  end
end

