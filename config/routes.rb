Rails.application.routes.draw do
  devise_for :users
  resources :courses, only: [:new]
  resources :users, only: [:index, :edit, :show, :update]
  root "home#index"

  get 'static_pages/privacy_policy'
end
