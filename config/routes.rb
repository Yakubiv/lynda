Rails.application.routes.draw do
  
  devise_for :admins
  root 'services#index'
  resources :services
end
