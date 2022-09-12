Rails.application.routes.draw do

  root "home#index"

  namespace :api do
    namespace :v1 do
      resources :jobs , defaults: {format: :json}
    end
  end

  namespace :api do
    namespace :v1 do
      resources :job_application , defaults: {format: :json}
    end
  end

  resources :signin 
  
  resources :signup

  resources :applications_front

  resources :seeker


  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  # # ...


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
