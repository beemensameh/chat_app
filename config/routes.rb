Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :applications, only: [:create, :show], param: :token do
        resources :chats, only: [:index, :create], param: :number do
          resources :messages, only: [:index, :create]
        end
      end
    end
  end
end
