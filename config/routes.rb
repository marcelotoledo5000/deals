Rails.application.routes.draw do
  devise_for :users

  root to:'home#index'

  resources :deals, only: [:create, :destroy, :edit, :new, :show, :update]
end
