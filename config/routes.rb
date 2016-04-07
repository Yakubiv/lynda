Rails.application.routes.draw do
  devise_for :admins
  root 'dashboard#index'
  resources :services
  resources :orders, only: [:index, :show] do
    resources :receipts, only: [:create, :show, :new]
    resources :images
  end
  resources :appointments do
    resources :orders, except: [:index, :show]
  	collection do
  		get :canceled
  	end
  end
  resources :dashboard, only: [:index] do
    collection do
      get :oleg
      get :project
    end
  end
  resources :customers

  namespace :kursach do
    resources :tweets, only: [:index, :create]
  end
end
