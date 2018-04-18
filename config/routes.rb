Rails.application.routes.draw do
  devise_for :users

  root to:'deals#index'

  resources :deals
end
