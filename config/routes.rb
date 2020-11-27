Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  resources :tweets, only: [:index, :new, :create, :show] do
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
