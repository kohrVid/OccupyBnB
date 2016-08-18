Rails.application.routes.draw do
  root to: 'pages#index'
  resources :pages, only: [:index] do
    collection do
      get 'pages/help'
      get 'pages/privacy'
      get 'pages/tos'
    end
  end

  devise_scope :squatter do
    devise_for :squatters, controllers: { 
      sessions: "squatters/sessions",
      registrations: "squatters/registrations",
      passwords: "squatters/passwords",
      confirmations: "squatters/confirmations",
      omniauth_callbacks: "squatters/omniauth_callbacks" 
    }
  end

  resources :squatters, only: [:index, :show]

  resources :abodes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
