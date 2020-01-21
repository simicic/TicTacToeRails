Rails.application.routes.draw do
  resources :players, only: [:index, :create, :show]
end
