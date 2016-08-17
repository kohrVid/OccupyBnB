Rails.application.routes.draw do
  devise_scope :squatter do
    devise_for :squatters, controllers: { omniauth_callbacks: "callbacks" }
  end

  root to: "abodes#index"
  resources :abodes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
