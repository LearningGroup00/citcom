Rails.application.routes.draw do
  namespace :admin do
    get 'dashboard', to: 'dashboard#index', as: :dashboard
  end
  devise_for :users
  resources :complains
  
 
  root "complains#index"
end
