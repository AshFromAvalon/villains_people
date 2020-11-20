Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:index, :show]
  resources :orders, only: [:index] do
    resources :reviews, only:[:new, :create]
    collection do
      get :missions
    end
    member do
      patch :validate
      patch :refuse
      patch :done
      patch :pay
      patch :cancel
    end
  end
  resources :crimes, except: :show do
    resources :orders, only: [:new, :create]
  end
  resources :reviews, only:[:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
