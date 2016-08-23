Rails.application.routes.draw do
  root to: 'pages#index'
  get :search, to: "pages#abode_search"
  get :squatter_search, to: "pages#squatter_search"
  resources :pages, only: [:index] do
    collection do
      get :help
      get :privacy
      get :tos
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

  resources :squatters, only: [:index, :show] do
    member do
      get :submissions_pending_approval
    end
  end

  resources :abodes do
    resources :abode_images
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
