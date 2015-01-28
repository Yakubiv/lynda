Rails.application.routes.draw do
  
  devise_for :admins
  root 'appointments#index'
  resources :services
  resources :appointments do
  	collection do
  		get :completed
  		get :canceled
  	end
  end
  resources :customers
  
end
