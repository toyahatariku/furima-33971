Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :cards, only: [:new, :create]
  resources :items, except: [:index] do
    collection do
      get 'search'
    end
    resources :purchases, only: [:index, :create]
  end
end
