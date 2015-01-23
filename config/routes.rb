Rails.application.routes.draw do
  
  devise_for :admins
  root 'appointments#index'
  resources :services
  resources :appointments
  resources :customers, only: [:index, :show, :edit, :update, :destoy]
  
end
