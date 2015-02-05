Rails.application.routes.draw do

  devise_for :admins
  root 'appointments#index'
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
  resources :customers
  
end
