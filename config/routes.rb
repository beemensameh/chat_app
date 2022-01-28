Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :applications, only: [:create]

      get '/applications/:token', to: 'applications#show'
    end
  end
end
