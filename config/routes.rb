Rails.application.routes.draw do
  resources :lessons
  devise_for :users
  resources :courses, only: [:new, :index, :show, :edit, :create]
  resources :users, only: [:index, :edit, :show, :update]
  root "home#index"

  get 'static_pages/privacy_policy'
end
