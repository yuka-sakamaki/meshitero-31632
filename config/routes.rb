Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  resources :tweets do
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
