Rails.application.routes.draw do

  devise_for :admins
  root 'appointments#index'
  resources :services
  resources :orders, only: [:index]
  resources :appointments do
  resources :orders, except: [:index]
  	collection do
  		get :completed
  		get :canceled
  	end
  end
  resources :customers
  
end
