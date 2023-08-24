Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: {
        registrations: 'api/v1/registrations',
        sessions: 'api/v1/sessions'
      }
      resources :doctors, only: [:index, :show, :new, :create]
      resources :reservations, only: [:index, :create, :destroy]
    end
  end

end
