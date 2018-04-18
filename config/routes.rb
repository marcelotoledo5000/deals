Rails.application.routes.draw do
  devise_for :users

  root to:'deals#index'

  resources :deals do
    post 'won', to: 'deals#won'
    post 'lost', to: 'deals#lost'
  end
end
