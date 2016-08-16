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
    devise_for :squatters, controllers: { omniauth_callbacks: "callbacks" }
  end

  resources :abodes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
