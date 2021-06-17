Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :tools do
    resources :bookings , only: [:new,:create]
  end
  resources :bookings , only: [:index,:show] do
    member do
      patch "/accept", to:'bookings#accept'
      patch "/decline", to:'bookings#decline'
    end
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
