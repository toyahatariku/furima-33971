Rails.application.routes.draw do
  devise_for :users do
    resources :items, only: [:new, :create]
  end
    root to: "items#index"
end
