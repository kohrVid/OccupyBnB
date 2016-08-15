Rails.application.routes.draw do
  devise_scope :squatter do
    root to: "devise/registrations#new"
    devise_for :squatters
    get "login" => "devise/sessions#new"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
