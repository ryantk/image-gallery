Rails.application.routes.draw do
  devise_for :users, path: 'account', path_names: { sign_in: 'login', sign_out: 'logout', registration: 'registration', sign_up: '' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'public_galleries#index'
  resources :galleries
  resources :public_galleries, only: [:index]
end
