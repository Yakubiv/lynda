Rails.application.routes.draw do

  devise_for :admins
  root 'appointments#index'
  resources :services
  resources :orders, only: [:index] do
    resources :receipts, only: [:create, :show, :new]
  end
  resources :appointments do
  resources :orders, except: [:index]
  	collection do
  		get :canceled
  	end
  end
  resources :customers
  
end
