Rails.application.routes.draw do
  resources :challenges, only: %w[index create] do
    member do
      post :upvote
      post :collaborate
    end
  end
  devise_for :employees
  resources :employees, only: :show do
    member do
      get :challenges
      get :collaborations
    end
  end

  root to: 'challenges#index'
end
