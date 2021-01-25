Rails.application.routes.draw do
  resources :challenges, only: %w(index create) do
    member do
      post :upvote
      post :collaborate
    end
  end
  devise_for :employees

  # put 'challenges/upvote/:id', to: 'challenges#upvote', as: 'challenge_upvote'
  # post 'challenges/collaborate/:id', to: 'challenges#collaborate', as: 'challenge_collaborate'

  root to: 'challenges#index'
end
