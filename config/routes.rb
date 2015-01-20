Rails.application.routes.draw do
  
  get 'customers/index'

  get 'customers/show'

  devise_for :admins
  root 'services#index'
  resources :services
  resources :appointments
  
end
