Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "properties#index"

  resources :properties, only: [:index, :show, :new, :create]
end
