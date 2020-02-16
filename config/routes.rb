Rails.application.routes.draw do
  # get 'facilities/index'
  # get 'facilities/show'
  devise_for :facilities, controllers:{
    sessions: 'facilities/sessions',
    passwords: 'facilities/passwords',
    registrations: 'facilities/registrations'
  }
  devise_for :teams
  root "posts#index"
  resources :posts do
    get :search, on: :collection
  end
  resources :teams, only: [:index, :show] do
    get :affiliation, on: :member
  end
  resources :players
  resources :facilities, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
