Rails.application.routes.draw do
  resources :challenges, only: %w(index create)
  devise_for :employees

  root to: 'challenges#index'
end
