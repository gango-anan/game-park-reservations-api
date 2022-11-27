Rails.application.routes.draw do
  root 'main#index'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'register', to: 'users#create'
      post 'sign_in', to: 'tokens#create'
      resources :users, only: %i[index show update destroy]
      resources :activities
      resources :reservations
    end
  end
end
