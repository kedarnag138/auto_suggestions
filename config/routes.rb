Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      get :suggestions, to: 'users#suggestions'
    end
  end
end
