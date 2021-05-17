Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index]
      resources :pets, only: :create

      resources :users, only: [:index] do
        resources :pets, controller: :user_pets, only: :index
      end
    end
  end
end
