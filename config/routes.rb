Rails.application.routes.draw do
  scope '/api/v1', defaults: { format: :json } do
    devise_for :users
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :photos
      resources :users, only: [] do
        resources :like, as: :likes, only: :create
      end
      resources :matches, only: [:index, :destroy]
      resources :chat, as: :chats, only: [] do
        resources :messages, only: [:index, :create]
      end
    end
  end
end
