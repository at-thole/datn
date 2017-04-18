Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  namespace :admin do
    get "/" => "static_pages#index"
    resources :categories
    resources :cities
    resources :travel_places
  end

  resources :travel_places do
    collection do
      match 'search' => 'static_pages#index', via: [:get, :post], as: :search
    end
  end
  resources :comments
  resources :rates, only: [:create]
  resources :recommenders, only: :index
  resources :searchs
end
