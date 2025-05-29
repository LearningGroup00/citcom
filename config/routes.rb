Rails.application.routes.draw do
  resources :complains
 
  root "complains#index"
end
