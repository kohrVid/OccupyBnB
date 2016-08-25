Rails.application.routes.draw do
  root to: 'pages#index'
  get :abode_search, to: "pages#abode_search"
  get :search, to: "pages#search"
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
    resources :messages, except: [:destroy, :edit, :index] do
      collection do
	get :sent_items
      end
      collection do
	get :inbox
      end
      member do
	get :reply
      end
    end
  end

  resources :abodes do
    resources :abode_images
  end
  resources :abode_reviews
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
