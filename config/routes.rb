Rails.application.routes.draw do
  devise_for :users
  resources :complains
 
  root "complains#index"
end
