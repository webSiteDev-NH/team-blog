Rails.application.routes.draw do
  devise_for :teams
  root "posts#index"
  resources :posts
  resources :teams, only: :show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
