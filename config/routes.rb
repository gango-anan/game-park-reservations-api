Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'register', to: 'users#create'
      resources :users, only: %i[show update destroy]
      resources :tokens, only: [:create]
      resources :activities
    end
  end
end
