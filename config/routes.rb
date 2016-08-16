Rails.application.routes.draw do
  devise_scope :squatter do
    root to: "devise/registrations#edit"
    devise_for :squatters, controllers: { omniauth_callbacks: "callbacks" }
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
