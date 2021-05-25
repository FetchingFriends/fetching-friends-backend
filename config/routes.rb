Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # if Rails.env.development?
  #   mount Sidekiq::Web => '/sidekiq'
  # end

  namespace :api do
    namespace :v1 do
      resources :pets, only: [:create, :index]

      resources :users, only: [:create, :index] do
        resources :pets, controller: :user_pets, only: :index
      end
      resources :pet_applications, only: [:create, :update]
    end
  end
end
