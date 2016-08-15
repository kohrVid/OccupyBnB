Rails.application.routes.draw do
  devise_for :squatters
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "devise/registrations#new"
end
